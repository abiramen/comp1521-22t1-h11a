        .text
main:
                                                # int i: $t0
                                                # int x: $t4
                                                # int y: $t5
loop_i_to_5_init:
        li      $t0, 0                          # i = 0

loop_i_to_5_cond:
        bge     $t0, 5, loop_i_to_5_end

loop_i_to_5_step:
        mul     $t1, $t0, 4                     # 4 * i

        li      $t3, 9
        sub     $t2, $t3, $t0                   # 9 - i
        mul     $t2, $t2, 4                     # 4 * (9 - i)

        lw      $t4, numbers($t1)               # int x = numbers[i];
        lw      $t5, numbers($t2)               # int y = numbers[9 - i];

        sw      $t5, numbers($t1)
        sw      $t4, numbers($t2)

        addi    $t0, $t0, 1
        j       loop_i_to_5_cond

loop_i_to_5_end:
        li      $v0, 0
        jr      $ra


        .data
numbers:
        .word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9
