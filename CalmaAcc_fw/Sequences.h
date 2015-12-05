/*
 * Sequences.h
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#ifndef SEQUENCES_H_
#define SEQUENCES_H_

struct OnOffTime_t {
    uint32_t OnTime, OffTime;
};

static const OnOffTime_t Seq[] = {
        {27, 270},
        {27, 1800}
};
#define SEQ_CNT   2



#endif /* SEQUENCES_H_ */
