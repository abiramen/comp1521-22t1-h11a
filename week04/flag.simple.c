#include <stdio.h>
#define N_ROWS 6
#define N_COLS 12
 
 
char flag[N_ROWS][N_COLS] = {
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
};

int main(void) {
main__row_loop_init:
    int row = 0;
main__row_loop_cond:
    if (row >= N_ROWS) goto main__row_loop_end;
main__row_loop_step:
main__col_loop_init:
        int col = 0;
main__col_loop_cond:
        if (col >= N_COLS) goto main__col_loop_end;
main__col_loop_step:
            printf("%c", flag[row][col]); // flag + (row * N_COLS + col) * sizeof(char)
            col++;
            goto main__col_loop_cond;
main__col_loop_end:
        printf("\n");
        row++;
        goto main__row_loop_cond;
main__row_loop_end:
    return 0;
}
