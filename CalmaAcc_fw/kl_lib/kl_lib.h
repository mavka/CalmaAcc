/*
 * kl_lib.h
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#ifndef KL_LIB_H_
#define KL_LIB_H_

#include "stm32f0xx_hal.h"

enum State_t {
    staInProgress,
    staDone
};
#if 1 // Pins and timers
#define TMR_ENABLE(PTimer)          PTimer->CR1 |=  TIM_CR1_CEN;
#define TMR_DISABLE(PTimer)         PTimer->CR1 &= ~TIM_CR1_CEN;
#define TMR_PCCR(PTimer, AChannel)  ((uint32_t*)(&PTimer->CCR1 + AChannel-1))

enum Inverted_t {invNotInverted, invInverted};
enum PinOutMode_t {omPushPull = 0, omOpenDrain = 1};
enum PinPullUpDown_t {
    pudNone = 0b00,
    pudPullUp = 0b01,
    pudPullDown = 0b10
};
enum PinSpeed_t {
    psLow = 0b00,
    psMedium = 0b01,
    psHigh = 0b11
};
#define PIN_SPEED_DEFAULT   psMedium

enum PinAF_t {
    AF0=0, AF1=1, AF2=2, AF3=3, AF4=4, AF5=5, AF6=6, AF7=7,
};

static inline void PinSet    (GPIO_TypeDef *PGpioPort, const uint16_t APinNumber) { PGpioPort->BSRR = (uint32_t)(1<<APinNumber); }
static inline void PinClear  (GPIO_TypeDef *PGpioPort, const uint16_t APinNumber) { PGpioPort->BRR  = (uint32_t)(1<<APinNumber); }
// Check state
static inline bool PinIsSet(GPIO_TypeDef *PGpioPort, const uint16_t APinNumber) { return (PGpioPort->IDR & (uint32_t)(1<<APinNumber)); }

static void PinClockEnable(GPIO_TypeDef *PGpioPort) {
    if     (PGpioPort == GPIOA) RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
    else if(PGpioPort == GPIOB) RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
    else if(PGpioPort == GPIOF) RCC->AHBENR |= RCC_AHBENR_GPIOFEN;
}

static inline void PinSetupOut(
        GPIO_TypeDef *PGpioPort,
        const uint16_t APinNumber,
        const PinOutMode_t PinOutMode,
        const PinPullUpDown_t APullUpDown = pudNone,
        const PinSpeed_t ASpeed = PIN_SPEED_DEFAULT
        ) {
    // Clock
    PinClockEnable(PGpioPort);
    uint8_t Offset = APinNumber*2;
    // Setup mode
    PGpioPort->MODER &= ~(0b11 << Offset);  // clear previous bits
    PGpioPort->MODER |=   0b01 << Offset;   // Set new bits
    // Setup output type
    PGpioPort->OTYPER &= ~(1<<APinNumber);
    PGpioPort->OTYPER |= (uint32_t)PinOutMode << APinNumber;
    // Setup Pull-Up or Pull-Down
    PGpioPort->PUPDR &= ~(0b11 << Offset); // clear previous bits
    PGpioPort->PUPDR |= (uint32_t)APullUpDown << Offset;
    // Setup speed
    PGpioPort->OSPEEDR &= ~(0b11 << Offset); // clear previous bits
    PGpioPort->OSPEEDR |= (uint32_t)ASpeed << Offset;
}

static inline void PinSetupIn(
        GPIO_TypeDef *PGpioPort,
        const uint16_t APinNumber,
        const PinPullUpDown_t APullUpDown
        ) {
    // Clock
    PinClockEnable(PGpioPort);
    // Setup mode
    PGpioPort->MODER &= ~(0b11 << (APinNumber*2)); // clear previous bits
    // Setup Pull-Up or Pull-Down
    PGpioPort->PUPDR &= ~(0b11 << (APinNumber*2)); // clear previous bits
    PGpioPort->PUPDR |= (uint32_t)APullUpDown << (APinNumber*2);
}

static inline void PinSetupAlterFunc(
        GPIO_TypeDef *PGpioPort,
        const uint16_t APinNumber,
        const PinOutMode_t PinOutMode,
        const PinPullUpDown_t APullUpDown,
        const PinAF_t AAlterFunc,
        const PinSpeed_t ASpeed = PIN_SPEED_DEFAULT) {
    // Clock
    PinClockEnable(PGpioPort);
    uint32_t Offset = APinNumber*2;
    // Setup mode
    PGpioPort->MODER &= ~(0b11 << Offset);  // clear previous bits
    PGpioPort->MODER |= 0b10 << Offset;     // Set new bits
    // Setup output type
    PGpioPort->OTYPER &= ~(1<<APinNumber);
    PGpioPort->OTYPER |= (uint32_t)PinOutMode << APinNumber;
    // Setup Pull-Up or Pull-Down
    PGpioPort->PUPDR &= ~(0b11 << Offset); // clear previous bits
    PGpioPort->PUPDR |= (uint32_t)APullUpDown << Offset;
    // Setup speed
    PGpioPort->OSPEEDR &= ~(0b11 << Offset); // clear previous bits
    PGpioPort->OSPEEDR |= (uint32_t)ASpeed << Offset;
    // Setup Alternate Function
    uint32_t n = (APinNumber <= 7)? 0 : 1;      // 0 if 0...7, 1 if 8..15
    Offset = 4 * ((APinNumber <= 7)? APinNumber : APinNumber - 8);
    PGpioPort->AFR[n] &= ~(0b1111 << Offset);
    PGpioPort->AFR[n] |= (uint32_t)AAlterFunc << Offset;
}
#endif

#if 1 // ============================ Time =====================================
static inline bool TimeElapsed(uint32_t *PSince, uint32_t Delay_ms) {
    bool Rslt = (uint32_t)(HAL_GetTick() - *PSince) > Delay_ms;
    if(Rslt) *PSince = HAL_GetTick();
    return Rslt;
}

static inline void ResetDelayVar(uint32_t *PSince) {
    *PSince = HAL_GetTick();
}
#endif

#if 0 // ============================== I2C ====================================
#define I2C_KL  TRUE

class i2c_t {
private:
    I2C_TypeDef *ii2c;
    GPIO_TypeDef *IPGpio;
    uint16_t ISclPin, ISdaPin;
    uint32_t IBitrateHz;
    void SendStart()     { ii2c->CR1 |= I2C_CR1_  _CR1_START; }
    void SendStop()      { ii2c->CR1 |= I2C_CR1_STOP; }
    void AckEnable()     { ii2c->CR1 |= I2C_CR1_ACK; }
    void AckDisable()    { ii2c->CR1 &= ~I2C_CR1_ACK; }
    bool RxIsNotEmpty()  { return (ii2c->SR1 & I2C_SR1_RXNE); }
    void ClearAddrFlag() { (void)ii2c->SR1; (void)ii2c->SR2; }
    void SignalLastDmaTransfer() { ii2c->CR2 |= I2C_CR2_LAST; }
    // Address and data
    void SendAddrWithWrite(uint8_t Addr) { ii2c->DR = (uint8_t)(Addr<<1); }
    void SendAddrWithRead (uint8_t Addr) { ii2c->DR = ((uint8_t)(Addr<<1)) | 0x01; }
    void SendData(uint8_t b) { ii2c->DR = b; }
    uint8_t ReceiveData() { return ii2c->DR; }
    // Flags operations
    uint8_t IBusyWait();
    uint8_t WaitEv5();
    uint8_t WaitEv6();
    uint8_t WaitEv8();
    uint8_t WaitAck();
    uint8_t WaitRx();
    uint8_t WaitStop();
    uint8_t WaitBTF();
public:
    bool Error;
    Thread *PRequestingThread;
    const stm32_dma_stream_t *PDmaTx, *PDmaRx;
    void Init();
    void Standby();
    void Resume();
    void Reset();
    void BusScan();
    uint8_t WriteRead(uint8_t Addr, uint8_t *WPtr, uint8_t WLength, uint8_t *RPtr, uint8_t RLength);
    uint8_t WriteWrite(uint8_t Addr, uint8_t *WPtr1, uint8_t WLength1, uint8_t *WPtr2, uint8_t WLength2);
    uint8_t Write(uint8_t Addr, uint8_t *WPtr1, uint8_t WLength1);
    i2c_t(I2C_TypeDef *pi2c,
            GPIO_TypeDef *PGpio, uint16_t SclPin, uint16_t SdaPin,
            uint32_t BitrateHz,
            const stm32_dma_stream_t *APDmaTx, const stm32_dma_stream_t *APDmaRx) :
                ii2c(pi2c), IPGpio(PGpio), ISclPin(SclPin), ISdaPin(SdaPin), IBitrateHz(BitrateHz),
                Error(false), PRequestingThread(nullptr),
                PDmaTx(APDmaTx), PDmaRx(APDmaRx) {}

};
#endif


#endif /* KL_LIB_H_ */
