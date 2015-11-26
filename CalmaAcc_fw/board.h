/*
 * board.h
 *
 *  Created on: 12 ����. 2015 �.
 *      Author: Kreyl
 */

#ifndef BOARD_H_
#define BOARD_H_

#include <inttypes.h>

// ==== General ====
#define BOARD_NAME          "AccCalma"
// MCU type as defined in the ST header.
#define STM32F042x6

#define CRYSTAL_FREQ_HZ     12000000    // Freq of external crystal

// USB
//#define USBDrv      	USBD1   // USB driver to use

#if 1 // ========================== GPIO =======================================
// UART
#define UART_GPIO       GPIOA
#define UART_TX_PIN     2
#define UART_RX_PIN     3
#define UART_AF         AF1

// LEDs
#define LED0_GPIO       GPIOB
#define LED0_PIN        1
#define LED1_GPIO       GPIOA
#define LED1_PIN        7
#define LED2_GPIO       GPIOA
#define LED2_PIN        6

// USB
//#define USB_GPIO		GPIOA
//#define USB_DM_PIN		11
//#define USB_DP_PIN		12
#endif

#if 1 // ========================= Timers ======================================
#define TIM_LED0        TIM3
#define TIM_LED1        TIM3
#define TIM_LED2        TIM3

#define TIMC_LED0       4
#define TIMC_LED1       1
#define TIMC_LED2       2

#endif

#if 1 // =========================== SPI =======================================

#endif

#if 1 // ========================== USART ======================================
#define UART            USART2
#define UART_TX_REG     UART->TDR
#define UART_RX_REG     UART->RDR
#endif

#if 0 // =========================== ADC =======================================
#define ADC_REQUIRED        TRUE
// Clock divider: clock is generated from the APB2
#define ADC_CLK_DIVIDER     adcDiv2 // 32MHz / 2 = 16MHz

// ADC channels: LED3, LED6
#define SNS_CHNL0           10
#define SNS_CHNL1           14

#define ADC_VREFINT_CHNL    17  // All 4xx devices. Do not change.
const uint8_t AdcChannels[] = { SNS_CHNL0, SNS_CHNL1 };
#define ADC_CHANNEL_CNT     2   // Do not use countof(AdcChannels) as preprocessor does not know what is countof => cannot check
#define ADC_SAMPLE_TIME     ast55d5Cycles
#define ADC_SAMPLE_CNT      8   // How many times to measure every channel

#define ADC_MAX_SEQ_LEN     16  // 1...16   // Const, see ref man
#define ADC_SEQ_LEN         (ADC_SAMPLE_CNT * ADC_CHANNEL_CNT)
#if (ADC_SEQ_LEN > ADC_MAX_SEQ_LEN) || (ADC_SEQ_LEN == 0)
#error "Wrong ADC channel count and sample count"
#endif
#endif

#if 1 // =========================== DMA =======================================
#define STM32_DMA_REQUIRED  TRUE
// Uart
#define UART_DMA_TX     STM32_DMA1_STREAM4
#define UART_DMA_RX     STM32_DMA1_STREAM5
#define UART_DMA_CHNL   0   // Dummy

// ADC
#if ADC_REQUIRED
/* DMA request mapped on this DMA channel only if the corresponding remapping bit is cleared in the SYSCFG_CFGR1
 * register. For more details, please refer to Section10.1.1: SYSCFG configuration register 1 (SYSCFG_CFGR1) on
 * page173 */
#define ADC_DMA         STM32_DMA1_STREAM1
#define ADC_DMA_MODE    STM32_DMA_CR_CHSEL(0) |   /* DMA2 Stream4 Channel0 */ \
                        DMA_PRIORITY_LOW | \
                        STM32_DMA_CR_MSIZE_HWORD | \
                        STM32_DMA_CR_PSIZE_HWORD | \
                        STM32_DMA_CR_MINC |       /* Memory pointer increase */ \
                        STM32_DMA_CR_DIR_P2M |    /* Direction is peripheral to memory */ \
                        STM32_DMA_CR_TCIE         /* Enable Transmission Complete IRQ */

#endif // ADC

#endif

#endif /* BOARD_H_ */
