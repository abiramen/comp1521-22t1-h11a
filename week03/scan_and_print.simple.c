#include <stdio.h>
 
int main(void) {
    int i;
    // initialise all the values in the array to 0
    // int numbers[10] = {0};
    int numbers[10];

loop_scan_i_to_10_init: 
    i = 0;
loop_scan_i_to_10_cond:
    if (i >= 10) goto loop_scan_i_to_10_end;
loop_scan_i_to_10_step:
    scanf("%d", &numbers[i]); // this is really just numbers + 4 * i

    i++;
    goto loop_scan_i_to_10_cond;

loop_scan_i_to_10_end:
loop_print_i_to_10_init: 
    i = 0;
loop_print_i_to_10_cond: 
    if (i >= 10) goto loop_print_i_to_10_end;
loop_print_i_to_10_step:
    printf("%d", numbers[i]);   // this is really just numbers + 4 * i
    putchar(' ');
    i++;
    goto loop_print_i_to_10_cond;
loop_print_i_to_10_end:
    putchar('\n');
    return 0;
}
