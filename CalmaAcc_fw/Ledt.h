/*
 * Ledt.h
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#ifndef LEDT_H_
#define LEDT_H_

#include "stm32f042x6.h"
#include "stm32f0xx_hal.h"
#include "kl_lib.h"

#define TOP_VALUE   255
#define INVERTED    invNotInverted

class Led_t {
private:
    GPIO_TypeDef *PGpio;
    uint16_t Pin;
    uint32_t TmrChnl;
    TIM_TypeDef* ITmr;
    uint32_t *PClk;
    uint32_t IDelayVar = 0, IDelay = 0;
    bool Increase = true;
    void Enable()  { TMR_ENABLE(ITmr); }
    void Disable() { TMR_DISABLE(ITmr); }
    void SetTopValue(uint32_t Value) { ITmr->ARR = Value; }
    void InitPwm(GPIO_TypeDef *GPIO, uint16_t N, uint8_t Chnl, uint32_t ATopValue, Inverted_t Inverted, PinOutMode_t OutputType);
public:
    uint32_t SmoothVar;
    void Init(GPIO_TypeDef *APGpio, uint16_t APin, TIM_TypeDef *APTimer, uint32_t ATmrChnl) {
        PGpio = APGpio;
        Pin = APin;
        TmrChnl = ATmrChnl;
        ITmr = APTimer;
        if     (ITmr == TIM1)  { RCC->APB2ENR |= RCC_APB2ENR_TIM1EN; }
        else if(ITmr == TIM2)  { RCC->APB1ENR |= RCC_APB1ENR_TIM2EN; }
        else if(ITmr == TIM3)  { RCC->APB1ENR |= RCC_APB1ENR_TIM3EN; }
        InitPwm(PGpio, Pin, TmrChnl, TOP_VALUE, INVERTED, omPushPull);
        Enable();
    }
    void Set(const uint8_t AValue) { *TMR_PCCR(ITmr, TmrChnl) = AValue; }    // CCR[N] = AValue
    uint8_t Inc() {
        uint16_t v = *TMR_PCCR(ITmr, TmrChnl);
        if(v >= TOP_VALUE) return 1;
        v++;
        *TMR_PCCR(ITmr, TmrChnl) = v;
        return 0;
    }
    uint8_t Dec() {
        uint16_t v = *TMR_PCCR(ITmr, TmrChnl);
        if(v == 0) return 1;
        v--;
        *TMR_PCCR(ITmr, TmrChnl) = v;
        return 0;
    }
    void Task();
};

#endif /* LEDT_H_ */
