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
#include "board.h"

#define INVERTED    invNotInverted

#define LED_CNT     3

struct LedCfg_t {
    GPIO_TypeDef *PGpio;
    uint16_t Pin;
    TIM_TypeDef *PTimer;
    uint32_t TmrChnl;
};

static const LedCfg_t LedCfg[LED_CNT] = {
        {LED0_GPIO, LED0_PIN, TIM_LED0, TIMC_LED0},
        {LED1_GPIO, LED1_PIN, TIM_LED1, TIMC_LED1},
        {LED2_GPIO, LED2_PIN, TIM_LED2, TIMC_LED2}
};

class Led_t {
private:
    uint32_t *PClk;
    uint32_t IDelayVar = 0, IDelay = 0;
    uint32_t CurrBrt = 0, TargetBrt;
    uint32_t SmoothVar;
    bool IEnabled;
    void Enable();
    void Disable();
    void InitPwm(uint8_t N);
public:

    void Init();
    void Set(const uint8_t AValue);
    uint8_t Inc();
    uint8_t Dec();
    void Start(uint32_t ATargetBrt, uint32_t ASmoothVar, bool AEnabled);
    State_t Task();
};

#endif /* LEDT_H_ */
