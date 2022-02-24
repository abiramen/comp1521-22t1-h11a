#include <stdio.h>

int main(void) {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x > 46340) goto if_x_gt_46340;

    y = x * x;
    printf("%d", y);
    putchar('\n');

    goto finally;

if_x_gt_46340:
    printf("square too big for 32 bits\n");

finally:
    return 0;
}



