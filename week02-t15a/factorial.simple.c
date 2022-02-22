// non recursively calculate a factorial in C
// Abiram Nadarajah, Feb 2022

#include <stdio.h>

int main(void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);
 
    int fac = 1;
loop_i_to_n_init:
    int i = 1;
loop_i_to_n_step:
    if (i > n) goto loop_i_to_n_end; 
    fac *= i; // fac = fac * i
    i++;
    goto loop_i_to_n_step;

loop_i_to_n_end: 
    // printf("%d! = %d\n", n, fac);
    printf("%d", n);
    printf("! = ");
    printf("    %d", fac);
    putchar('\n');
    return 0;
}
