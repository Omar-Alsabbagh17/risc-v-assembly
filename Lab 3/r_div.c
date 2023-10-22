#include <stdio.h>
int main(){
    int dividend = 0xFF;
    int divisor = 0x4;
    int quo = 0;
    int rem = dividend;
    int div = divisor << 8;
    int rep = 0;
    while (rep < 9){
        rem = rem - div;
        //if rem >= 0 + 3
        if(rem >= 0) 
            quo = (quo << 1) | 0x01;
        else {
            rem = (rem + div);
            quo = quo << 1;
        }
        div = div >> 1;
        rep = rep + 1;
    }
    printf("quo = %d, rem = %d", quo, rem);
    return 0;
}