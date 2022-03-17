#include <stdio.h>

int main(void) {
    int n;
    printf("Enter a number in decimal: ");
    scanf("%d", &n);

    printf("Your number in hexadecimal is: %x\n", n);
    printf("Your number in octal is: %o\n", n);

    return 0;
}
