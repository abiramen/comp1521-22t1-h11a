#include <stdio.h>
 
int main(void) {
    int i;
    int numbers[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

loop_i_to_5_init:
    i = 0;

loop_i_to_5_cond:
    if (i >= 5) goto loop_i_to_5_end;

loop_i_to_5_step:
    int x = numbers[i]; // numbers + 4 * i
    int y = numbers[9 - i]; // numbers + 4 * (9 - i)
    numbers[i] = y;
    numbers[9 - i] = x;
    i++;
    goto loop_i_to_5_cond;

loop_i_to_5_end:
    return 0;
}
