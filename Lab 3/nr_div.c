#include <stdio.h>
int main(){
    int dividend = 0xFF;
    int divisor = 0x4;
    int div = divisor << 8;
    int rep = 0;
    int rem_q = dividend;
    while (rep < 8){ // + 1
        if(rem_q >= 0) {
            rem_q = rem_q << 1;
            rem_q = rem_q - div;
        } else {
            rem_q = rem_q << 1;
            rem_q = rem_q + div;
        }
        if(rem_q >= 0)
            rem_q = rem_q | 0x1;
        rep = rep + 1;
    }
    if(rem_q < 0) {
        rem_q = rem_q + div;
    }
    int quo = rem_q & 0xFF;
    int rem = rem_q >> 8;
    printf("quo = %d, rem = %d", quo, rem);
    return 0;
}