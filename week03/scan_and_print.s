        .text
main:
                                                        # int i: $t0

loop_scan_i_to_10_init: 
        li      $t0, 0                                  # i = 0;
loop_scan_i_to_10_cond:
        bge     $t0, 10, loop_scan_i_to_10_end          # if (i >= 10) goto loop_scan_i_to_10_end;
loop_scan_i_to_10_step:
        li      $v0, 5
        syscall                                         #

        mul     $t1, $t0, 4                             # 4 * i
        sw      $v0, numbers($t1)                       # scanf("%d", &numbers[i]);

        addi    $t0, $t0, 1                             # i++
        j       loop_scan_i_to_10_cond                  # goto loop_scan_i_to_10_cond;


loop_scan_i_to_10_end:
loop_print_i_to_10_init:
        li      $t0, 0                                  # i = 0;
loop_print_i_to_10_cond:
        bge     $t0, 10, loop_print_i_to_10_end          # if (i >= 10) goto loop_print_i_to_10_end;    
loop_print_i_to_10_step:
        
        mul     $t1, $t0, 4                             # 4 * i
        lw      $a0, numbers($t1)
        
        li      $v0, 1
        syscall                                         # printf("%d", numbers[i]);

        li      $v0, 11
        li      $a0, ' '
        syscall                                         # putchar(' ')

        addi    $t0, $t0, 1                             # i++
        j       loop_print_i_to_10_cond

loop_print_i_to_10_end:
        li      $v0, 11
        li      $a0, '\n'
        syscall                                         # putchar('\n')

        li      $v0, 0                                  # return 0
        jr      $ra






        .data
numbers:
        .space  4 * 10 
