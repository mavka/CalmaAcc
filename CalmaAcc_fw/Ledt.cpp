/*
 * Ledt.cpp
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#include <Ledt.h>


static inline uint32_t ICalcDelay(uint32_t CurrentBrightness, uint32_t SmoothVar) { return (uint32_t)((SmoothVar / (CurrentBrightness+4)) + 1); }


void Led_t::InitPwm(GPIO_TypeDef *GPIO, uint16_t N, uint8_t Chnl, uint32_t ATopValue, Inverted_t Inverted, PinOutMode_t OutputType) {
    if     (ITmr == TIM1)  PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF2);
    else if(ITmr == TIM3)  PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF1);
    else if(ITmr == TIM14) {
        if(GPIO == GPIOA) PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF4);
        else PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF0);
    }
#ifdef TIM15
    else if(ITmr == TIM15) {
        if(GPIO == GPIOA) PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF0);
        else PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF1);
    }
#endif
    else if(ITmr == TIM16 or ITmr == TIM17) {
        if(GPIO == GPIOA) PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF5);
        else PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF2);
    }
    ITmr->ARR = ATopValue;
    // Output
    uint16_t tmp = (Inverted == invInverted)? 0b111 : 0b110; // PWM mode 1 or 2
    switch(Chnl) {
        case 1:
            ITmr->CCMR1 |= (tmp << 4);
            ITmr->CCER  |= TIM_CCER_CC1E;
            break;
        case 2:
            ITmr->CCMR1 |= (tmp << 12);
            ITmr->CCER  |= TIM_CCER_CC2E;
            break;
        case 3:
            ITmr->CCMR2 |= (tmp << 4);
            ITmr->CCER  |= TIM_CCER_CC3E;
            break;
        case 4:
            ITmr->CCMR2 |= (tmp << 12);
            ITmr->CCER  |= TIM_CCER_CC4E;
            break;
        default: break;
    }
}

void Led_t::Task() {
    if(TimeElapsed(&IDelayVar, IDelay)) {
        if(Increase) {
            if(Inc() != 0) Increase = false;
        }
        else {
            if(Dec() != 0) Increase = true;
        }
        IDelay = ICalcDelay(*TMR_PCCR(ITmr, TmrChnl), SmoothVar);
    }
}
