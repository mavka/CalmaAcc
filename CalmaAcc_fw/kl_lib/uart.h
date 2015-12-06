/*
 * cmd_uart.h
 *
 *  Created on: 15.04.2013
 *      Author: kreyl
 */

#ifndef UART_H_
#define UART_H_

#include <kl_lib.h>
#include "kl_sprintf.h"
#include <cstring>
#include "board.h"

#define UART_USE_DMA        FALSE

// ==== TX ====
#define UART_TXBUF_SZ       180

#define UART_DMA_TX_MODE    STM32_DMA_CR_CHSEL(UART_DMA_CHNL) | \
                            DMA_PRIORITY_LOW | \
                            STM32_DMA_CR_MSIZE_BYTE | \
                            STM32_DMA_CR_PSIZE_BYTE | \
                            STM32_DMA_CR_MINC |       /* Memory pointer increase */ \
                            STM32_DMA_CR_DIR_M2P |    /* Direction is memory to peripheral */ \
                            STM32_DMA_CR_TCIE         /* Enable Transmission Complete IRQ */


class Uart_t {
private:
    uint32_t IBaudrate;
#if UART_USE_DMA
    char TXBuf[UART_TXBUF_SZ];
    char *PRead = TXBuf, *PWrite = TXBuf;
    bool IDmaIsIdle = true;
    uint32_t IFullSlotsCount = 0, ITransSize;
    void ISendViaDMA();
#endif
public:
    void Init(uint32_t ABaudrate, GPIO_TypeDef *PGpioTx, const uint16_t APinTx);
    void OnAHBFreqChange();
#if UART_USE_DMA
    void Printf(const char *S, ...);
    void PrintfI(const char *S, ...);
    void FlushTx() { while(!IDmaIsIdle); }  // wait DMA
#endif
    void PrintfNow(const char *S, ...);

    // Inner use
#if UART_USE_DMA
    void IRQDmaTxHandler();
    void IPutChar(char c);
    void IPrintf(const char *format, va_list args);
#endif
};

extern Uart_t Uart;

#endif /* UART_H_ */
