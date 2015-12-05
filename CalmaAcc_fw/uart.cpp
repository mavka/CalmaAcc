/*
 * cmd_uart.cpp
 *
 *  Created on: 15.04.2013
 *      Author: kreyl
 */

#include <string.h>
#include "uart.h"
#include "main.h" // App_t
#include "stm32f042x6.h"

Uart_t Uart;

#if UART_USE_DMA
// Wrapper for TX IRQ
extern "C" {
void CmdUartTxIrq(void *p, uint32_t flags) { Uart.IRQDmaTxHandler(); }
}

// ==== TX DMA IRQ ====
void Uart_t::IRQDmaTxHandler() {
    dmaStreamDisable(UART_DMA_TX);    // Registers may be changed only when stream is disabled
    IFullSlotsCount -= ITransSize;
    PRead += ITransSize;
    if(PRead >= (TXBuf + UART_TXBUF_SZ)) PRead = TXBuf; // Circulate pointer

    if(IFullSlotsCount == 0) IDmaIsIdle = true; // Nothing left to send
    else ISendViaDMA();
}

extern "C" {
void PrintfC(const char *format, ...) {
//    chSysLock();
    va_list args;
    va_start(args, format);
    Uart.IPrintf(format, args);
    va_end(args);
//    chSysUnlock();
}
}

static inline void FPutChar(char c) { Uart.IPutChar(c); }

void Uart_t::Printf(const char *format, ...) {
    chSysLock();
    va_list args;
    va_start(args, format);
    IPrintf(format, args);
    va_end(args);
    chSysUnlock();
}

void Uart_t::PrintfI(const char *format, ...) {
    va_list args;
    va_start(args, format);
    IPrintf(format, args);
    va_end(args);
}

void Uart_t::IPutChar(char c) {
    *PWrite++ = c;
    if(PWrite >= &TXBuf[UART_TXBUF_SZ]) PWrite = TXBuf;   // Circulate buffer
}

void Uart_t::IPrintf(const char *format, va_list args) {
    int32_t MaxLength = UART_TXBUF_SZ - IFullSlotsCount;
    IFullSlotsCount += kl_vsprintf(FPutChar, MaxLength, format, args);
    // Start transmission if Idle
    if(IDmaIsIdle) ISendViaDMA();
}

void Uart_t::ISendViaDMA() {
    uint32_t PartSz = (TXBuf + UART_TXBUF_SZ) - PRead; // Cnt from PRead to end of buf
    ITransSize = MIN(IFullSlotsCount, PartSz);
    if(ITransSize != 0) {
        IDmaIsIdle = false;
        dmaStreamSetMemory0(UART_DMA_TX, PRead);
        dmaStreamSetTransactionSize(UART_DMA_TX, ITransSize);
        dmaStreamSetMode(UART_DMA_TX, UART_DMA_TX_MODE);
        dmaStreamEnable(UART_DMA_TX);
    }
}
#endif

#if 1 // ==== Print Now ====
static inline void FPutCharNow(char c) {
    while(!(UART->ISR & USART_ISR_TXE));
    UART_TX_REG = c;
    while(!(UART->ISR & USART_ISR_TXE));
}

void Uart_t::PrintfNow(const char *S, ...) {
    va_list args;
    va_start(args, S);
    kl_vsprintf(FPutCharNow, 99999, S, args);
    va_end(args);
}

extern "C" {
void PrintfCNow(const char *format, ...) {
    va_list args;
    va_start(args, format);
    kl_vsprintf(FPutCharNow, 99999, format, args);
    va_end(args);
}
}

#endif

// ==== Init & DMA ====
void Uart_t::Init(uint32_t ABaudrate, GPIO_TypeDef *PGpioTx, const uint16_t APinTx) {
    PinSetupAlterFunc(PGpioTx, APinTx, omPushPull, pudNone, UART_AF);
    IBaudrate = ABaudrate;
    // ==== USART configuration ====
    if(UART == USART1) {  RCC->APB2ENR |= RCC_APB2ENR_USART1EN; }
    else if(UART == USART2) { RCC->APB1ENR |= RCC_APB1ENR_USART2EN; }

    OnAHBFreqChange();  // Setup baudrate
    UART->CR2 = 0;
#if UART_USE_DMA    // ==== DMA ====
    dmaStreamAllocate     (UART_DMA_TX, IRQ_PRIO_MEDIUM, CmdUartTxIrq, NULL);
    dmaStreamSetPeripheral(UART_DMA_TX, &UART_TX_REG);
    dmaStreamSetMode      (UART_DMA_TX, UART_DMA_TX_MODE);
    IDmaIsIdle = true;
#endif

    UART->CR1 = USART_CR1_TE;     // Transmitter enabled
#if UART_USE_DMA
    UART->CR3 = USART_CR3_DMAT;   // Enable DMA at transmitter
#endif
    UART->CR1 |= USART_CR1_UE;    // Enable USART
}

void Uart_t::OnAHBFreqChange() {
    UART->BRR = HAL_RCC_GetHCLKFreq() / IBaudrate;
}
