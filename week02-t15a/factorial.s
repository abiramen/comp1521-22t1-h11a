# non recursively calculate a factorial in MIPS
# Abiram Nadarajah, Feb 2022

        .text
main:
        li      $v0, 4
        la      $a0, prompt_msg
        syscall                         # printf("n  = ")

        li      $v0, 5
        syscall
        move    $t0, $v0                # scanf("%d", &n);

        li      $t1, 1                  # int fac = 1;
loop_i_to_n_init:
        li      $t2, 1                  # int i = 1;
loop_i_to_n_step:
        bgt     $t2, $t0, loop_i_to_n_end       # if (i > n) goto loop_i_to_n_end;
        mul     $t1, $t1, $t2                   # fac = fac * i
        addi    $t2, $t2, 1                     # i = i + 1                 
        j       loop_i_to_n_step

loop_i_to_n_end:
        li      $v0, 1
        move    $a0, $t0
        syscall                         # printf("%d", fac);

        li      $v0, 4
        la      $a0, result_msg
        syscall                         # printf("!  = ")

        li      $v0, 1                  # printf("%d", fac);
        move    $a0, $t1
        syscall

        li      $v0, 11                 # putchar('\n')
        li      $a0, '\n'
        syscall

        li      $v0, 0                  # return 0;
        jr      $ra

        .data
prompt_msg:
        .asciiz "n  = "
result_msg:
        .asciiz "! = "
