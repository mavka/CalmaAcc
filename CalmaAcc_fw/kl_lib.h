/*
 * kl_lib.h
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#ifndef KL_LIB_H_
#define KL_LIB_H_

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

static void PinClockEnable(GPIO_TypeDef *PGpioPort) {
    if     (PGpioPort == GPIOA) RCC->AHBENR |= RCC_AHBENR_GPIOAEN;
    else if(PGpioPort == GPIOB) RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
    else if(PGpioPort == GPIOC) RCC->AHBENR |= RCC_AHBENR_GPIOCEN;
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

static inline bool TimeElapsed(uint32_t *PSince, uint32_t Delay_ms) {
    bool Rslt = (uint32_t)(HAL_GetTick() - *PSince) > Delay_ms;
    if(Rslt) *PSince = HAL_GetTick();
    return Rslt;
}




#endif /* KL_LIB_H_ */
