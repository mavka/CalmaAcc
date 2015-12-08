/*
 * Comparator.h
 *
 *  Created on: 8 дек. 2015 г.
 *      Author: Kreyl
 */

#ifndef COMPARATOR_H_
#define COMPARATOR_H_

#include <inttypes.h>

enum Result_t {rsltNone, rsltDetected};

#define COMP_TIMEOUT    3006

class Comparator_t {
private:
    uint32_t Stage=0;
    uint32_t IDelayVar=0;
    bool IsAccAlike();
public:
    Result_t ProcessData();

};



#endif /* COMPARATOR_H_ */
