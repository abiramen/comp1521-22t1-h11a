#include <stdio.h>
 
int counter() {
    int count = 0;
    count++;
    return count;
}
 
int main() {
    printf("%d\n", counter());
    printf("%d\n", counter());
    printf("%d\n", counter());
    printf("%d\n", counter());
}
