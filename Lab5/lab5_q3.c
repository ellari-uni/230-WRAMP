/**
 * Counts from "start" to "end" showing 
 * progress on the seven-segment displays
 **/

#include "lib_lab5.h"

void count(int start, int end){
    int i;

    if (start == end){
        writessd(start);
        delay();
        return;
    }
    if (start < end){
        for (i = start; i <= end; i++){
            writessd(i);
            delay();
        }
    } else {
        for (i = start; i >= end; i--){
            writessd(i);
            delay();
        }
    }
}
