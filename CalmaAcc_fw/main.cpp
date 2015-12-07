/**
 ******************************************************************************
 * File Name          : main.c
 * Description        : Main program body
 ******************************************************************************
 *
 * COPYRIGHT(c) 2015 STMicroelectronics
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of STMicroelectronics nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************
 */
/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx_hal.h"
#include "Ledt.h"
#include "board.h"
#include "Sequences.h"
#include "uart.h"
#include "acc.h"
#include "Comparator.h"

#define ACC_POLL_PERIOD     27

void SystemClock_Config();
// Modes
void SwitchMode();
void Off();

enum Mode_t {moVibroBlink=1, moBlink=2, moVibro=3, moSteady=4};
Mode_t Mode = moVibroBlink;

Led_t Led;
Comparator_t Comparator;

// Sequensor
const Seq_t *PStart = Seq, *PCurr = Seq;
uint32_t DelayVar = 0;
void SwitchSeqChunk();

#define VibroOn()   PinSet(VIBRO_GPIO, VIBRO_PIN)
#define VibroOff()  PinClear(VIBRO_GPIO, VIBRO_PIN)

int main(void) {
    SystemClock_Config();

    Uart.Init(115200, UART_GPIO, UART_TX_PIN);
    Uart.PrintfNow("\rCalmaAcc\r");

    Led.Init();
    // Vibro
    PinSetupOut(VIBRO_GPIO, VIBRO_PIN, omPushPull);

    // Acc
    Acc.SetPortAndPins(GPIOF, 1, 0, 5);
    while(!Acc.IsOperational) {
        Acc.Init();
        if(!Acc.IsOperational) {
            Uart.PrintfNow("Acc fail\r");
            while(!TimeElapsed(&DelayVar, 450));
        }
    }
    Uart.PrintfNow("Acc Ok\r");

    SwitchSeqChunk();

    uint32_t AccDelayVar=0;
    while(true) {
        switch(PCurr->Type) {
            case stSet:
                if(Led.Task() == staDone) {
                    PCurr++;
                    SwitchSeqChunk();
                }
                break;

            case stWait:
                if(TimeElapsed(&DelayVar, PCurr->Time_ms)) {
                    // Switch to next chunk
                    PCurr++;
                    SwitchSeqChunk();
                }
                break;

            case stGoto:
                PCurr = PStart + PCurr->Indx;
                SwitchSeqChunk();
                break;
        } // switch

        // Read Acc
        if(TimeElapsed(&AccDelayVar, ACC_POLL_PERIOD)) {
            Acc.ReadAccelerations();
//            Uart.PrintfNow("%03d %03d %03d\r", Acc.a[0], Acc.a[1], Acc.a[2]);
            if(Comparator.ProcessData() == rsltDetected) SwitchMode();
        }
    } // while 1
}

void SwitchSeqChunk() {
//    uint32_t N = PCurr - PStart;
//    Uart.PrintfNow("N=%u", N);
    switch(PCurr->Type) {
        case stSet:
//            Uart.PrintfNow("   Set=%u", PCurr->Brightness);
            // Prepare Led
            Led.Start(PCurr->Brightness, PCurr->Smooth, (Mode == moBlink or Mode == moVibroBlink));
            // Vibro: switch on in appropriate mode and if sequence requires it
            if(PCurr->VibroState == VibroOn and (Mode == moVibro or Mode == moVibroBlink)) VibroOn();
            else VibroOff();
            break;

        case stWait:
//            Uart.PrintfNow("   W=%u", PCurr->Time_ms);
            ResetDelayVar(&DelayVar);   // Reset delayvar
            break;

        case stGoto:
            break;
    } // switch
//    Uart.PrintfNow("\r");
}

#define BLINK_DELAY 9999
void SwitchMode() {
//    Uart.PrintfNow("Switch\r");
    // Indicate mode change
    for(int i = 0; i<9; i++) {
        Led.Set(LED_TOP_VALUE);
        DelayLoop(BLINK_DELAY);
        Led.Set(0);
        DelayLoop(BLINK_DELAY);
    }
    if(Mode == moSteady) Off();
    else Mode = (Mode_t)((int)Mode + 1);
    if(Mode == moSteady) Led.Set(LED_TOP_VALUE);
    switch(Mode) {
        case moVibroBlink: Uart.PrintfNow("VibroBlink\r"); break;
        case moBlink: Uart.PrintfNow("Blink\r"); break;
        case moVibro: Uart.PrintfNow("Vibro\r"); break;
        case moSteady: Uart.PrintfNow("Steady\r"); break;
    }
}

void Off() {
    Mode = moVibroBlink;
}


void SystemClock_Config(void) {
    RCC_OscInitTypeDef RCC_OscInitStruct;
    RCC_ClkInitTypeDef RCC_ClkInitStruct;
    RCC_PeriphCLKInitTypeDef PeriphClkInit;

    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
    RCC_OscInitStruct.HSIState = RCC_HSI_ON;
    RCC_OscInitStruct.HSICalibrationValue = 16;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
    HAL_RCC_OscConfig(&RCC_OscInitStruct);

    RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK;
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV4;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
    HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0);

    PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_I2C1;
    PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_HSI;
    HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit);

    HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq() / 1000);

    HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

    /* SysTick_IRQn interrupt configuration */
    HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}
