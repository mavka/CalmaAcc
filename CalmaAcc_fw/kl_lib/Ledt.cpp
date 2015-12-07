/*
 * Ledt.cpp
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#include <Ledt.h>


static inline uint32_t ICalcDelay(uint32_t CurrentBrightness, uint32_t SmoothVar) { return (uint32_t)((SmoothVar / (CurrentBrightness+4)) + 1); }

void Led_t::Enable() {
    for(uint8_t i=0; i<LED_CNT; i++) {
        TMR_ENABLE(LedCfg[i].PTimer);
    }
}
void Led_t::Disable() {
    for(uint8_t i=0; i<LED_CNT; i++) {
        TMR_DISABLE(LedCfg[i].PTimer);
    }
}

void Led_t::Init() {
    for(uint8_t i=0; i<LED_CNT; i++) {
        if     (LedCfg[i].PTimer == TIM1)  { RCC->APB2ENR |= RCC_APB2ENR_TIM1EN; }
        else if(LedCfg[i].PTimer == TIM2)  { RCC->APB1ENR |= RCC_APB1ENR_TIM2EN; }
        else if(LedCfg[i].PTimer == TIM3)  { RCC->APB1ENR |= RCC_APB1ENR_TIM3EN; }
        InitPwm(i);
        TMR_ENABLE(LedCfg[i].PTimer);
    }
}

void Led_t::Set(const uint8_t AValue) {
    for(uint8_t i=0; i<LED_CNT; i++) {
        *TMR_PCCR(LedCfg[i].PTimer, LedCfg[i].TmrChnl) = AValue;
    }
//    CurrBrt = AValue;
}

uint8_t Led_t::Inc() {
    if(CurrBrt >= LED_TOP_VALUE) return 1;
    else {
        CurrBrt++;
        if(IEnabled) {
            for(uint8_t i=0; i<LED_CNT; i++) {
                *TMR_PCCR(LedCfg[i].PTimer, LedCfg[i].TmrChnl) = CurrBrt;
            }
        }
        return 0;
    }
}
uint8_t Led_t::Dec() {
    if(CurrBrt == 0) return 1;
    else {
        CurrBrt--;
        if(IEnabled) {
            for(uint8_t i=0; i<LED_CNT; i++) {
                *TMR_PCCR(LedCfg[i].PTimer, LedCfg[i].TmrChnl) = CurrBrt;
            }
        }
        return 0;
    }
}


void Led_t::InitPwm(uint8_t N) {
    if     (LedCfg[N].PTimer == TIM1)  PinSetupAlterFunc(LedCfg[N].PGpio, LedCfg[N].Pin, omPushPull, pudNone, AF2);
    else if(LedCfg[N].PTimer == TIM3)  PinSetupAlterFunc(LedCfg[N].PGpio, LedCfg[N].Pin, omPushPull, pudNone, AF1);
    else if(LedCfg[N].PTimer == TIM14) {
        if(LedCfg[N].PGpio == GPIOA) PinSetupAlterFunc(LedCfg[N].PGpio, LedCfg[N].Pin, omPushPull, pudNone, AF4);
        else PinSetupAlterFunc(LedCfg[N].PGpio, LedCfg[N].Pin, omPushPull, pudNone, AF0);
    }
#ifdef TIM15
    else if(ITmr == TIM15) {
        if(GPIO == GPIOA) PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF0);
        else PinSetupAlterFunc(GPIO, N, OutputType, pudNone, AF1);
    }
#endif
    else if(LedCfg[N].PTimer == TIM16 or LedCfg[N].PTimer == TIM17) {
        if(LedCfg[N].PGpio == GPIOA) PinSetupAlterFunc(LedCfg[N].PGpio, LedCfg[N].Pin, omPushPull, pudNone, AF5);
        else PinSetupAlterFunc(LedCfg[N].PGpio, LedCfg[N].Pin, omPushPull, pudNone, AF2);
    }
    LedCfg[N].PTimer->ARR = LED_TOP_VALUE;
    // Output
    uint16_t tmp = (INVERTED == invInverted)? 0b111 : 0b110; // PWM mode 1 or 2
    switch(LedCfg[N].TmrChnl) {
        case 1:
            LedCfg[N].PTimer->CCMR1 |= (tmp << 4);
            LedCfg[N].PTimer->CCER  |= TIM_CCER_CC1E;
            break;
        case 2:
            LedCfg[N].PTimer->CCMR1 |= (tmp << 12);
            LedCfg[N].PTimer->CCER  |= TIM_CCER_CC2E;
            break;
        case 3:
            LedCfg[N].PTimer->CCMR2 |= (tmp << 4);
            LedCfg[N].PTimer->CCER  |= TIM_CCER_CC3E;
            break;
        case 4:
            LedCfg[N].PTimer->CCMR2 |= (tmp << 12);
            LedCfg[N].PTimer->CCER  |= TIM_CCER_CC4E;
            break;
        default: break;
    }
}


void Led_t::Start(uint32_t ATargetBrt, uint32_t ASmoothVar, bool AEnabled) {
    TargetBrt = ATargetBrt;
    SmoothVar = ASmoothVar;
    IEnabled = AEnabled;
    ResetDelayVar(&IDelayVar);
    IDelay = ICalcDelay(CurrBrt, SmoothVar);
}

State_t Led_t::Task() {
    if(CurrBrt == TargetBrt) return staDone;
    else {
        if(TimeElapsed(&IDelayVar, IDelay)) {
            if(CurrBrt < TargetBrt) {
                if(Inc() != 0) return staDone;
            }
            else { // CurrBrt > TargetBrt
                if(Dec() != 0) return staDone;
            }
            IDelay = ICalcDelay(CurrBrt, SmoothVar);
        } // if time elapsed
        return staInProgress;
    }
}
