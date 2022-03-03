#include <stdio.h>
#define N_ELEMENTS 5

int main(void) {
    // char array[N_ELEMENTS] = {'h', 'e', 'l', 'l', 'o'};
    int array[N_ELEMENTS] = {3, 1, 4, 1, 5};

    printf("array is %p\n", array);
    printf("&array[0] is %p\n", &array[0]);



    for (int i = 0; i < N_ELEMENTS; i++) {
        // & operator is the address-of operator which gives us memory addresses
        printf("i is %d: ", i);
        printf("%p: ", array + i);
        // c is actually doing array + sizeof(element) * i
        // in this case, array + 4 * i
    
        // * operator allows us to follow an address and see/modify what's there
        printf("%d", array[i]);

        putchar('\n');
    }

    return 0;
}


// What if we had
// int array[N_ELEMENTS] = {3, 1, 4, 1, 5};
