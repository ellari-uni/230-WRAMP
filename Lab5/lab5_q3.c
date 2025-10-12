/**
 * Counts from "start" to "end" showing 
 * progress on the seven-segment displays
 **/

#include "lib_lab5.h"

void count(int start, int end){
    int i;

    // If start and end are the same, just write it once and return
    if (start == end){
        writessd(start);
        delay();
        return;
    }

    // Else if start is less than end, count from start to end
    if (start < end){
        for (i = start; i <= end; i++){
            writessd(i);
            delay();
        }
    // else (Start is greater than end), count from end to start
    } else {
        for (i = start; i >= end; i--){
            writessd(i);
            delay();
        }
    }
}
