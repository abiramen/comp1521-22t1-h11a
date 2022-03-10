N_ROWS = 6
N_COLS = 12

        .text
main:
                                                # int row: $t0
                                                # int col: $t1
main__row_loop_init:
        li      $t0, 0                          # int row = 0;
main__row_loop_cond:
        bge     $t0, N_ROWS, main__row_loop_end # if (row >= N_ROWS) goto main__row_loop_end;
main__row_loop_step:
main__col_loop_init:
        li      $t1, 0                          # int col = 0;
main__col_loop_cond:
        bge     $t1, N_COLS, main__col_loop_end # if (col >= N_COLS) goto main__col_loop_end;
main__col_loop_step:
        mul     $t2, $t0, N_COLS                # row * N_COLS
        add     $t2, $t2, $t1                   # row * N_COLS + col
        lb      $a0, flag($t2)
        li      $v0, 11
        syscall                                 # printf("%c", flag[row][col]);

        addi    $t1, $t1, 1                     # col++
        j       main__col_loop_cond
main__col_loop_end:
        li      $v0, 11
        li      $a0, '\n'
        syscall                                 # putchar('\n')

        addi    $t0, $t0, 1                     # row++
        j       main__row_loop_cond

main__row_loop_end:
        li      $v0, 0
        jr      $ra                             # return 0


        .data
flag:
        
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.',
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
