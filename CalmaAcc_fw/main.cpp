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

void SystemClock_Config();

Led_t Led;

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
                    Acc.ReadAccelerations();
                    Uart.PrintfNow("%04d %04d %04d\r", Acc.a[0], Acc.a[1], Acc.a[2]);
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
    } // while 1
}

void SwitchSeqChunk() {
//    uint32_t N = PCurr - PStart;
//    Uart.PrintfNow("N=%u", N);
    switch(PCurr->Type) {
        case stSet:
//            Uart.PrintfNow("   Set=%u", PCurr->Brightness);
            // Prepare Led
            Led.Start(PCurr->Brightness, PCurr->Smooth);
            // Vibro
            if(PCurr->VibroState == VibroOn) VibroOn();
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
