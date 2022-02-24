        .text
main:
                                                # int n: $t0
                                                # int fac: $t1
                                                # int i: $t2
        li      $v0, 4
        la      $a0, prompt_msg
        syscall                                 # printf("n  = ");

        li      $v0, 5                  
        syscall
        move    $t0, $v0                        # scanf("%d", &n);

        li      $t1, 1                          # int fac = 1;

loop_i_to_n_init:
        li      $t2, 1                          # int i = 1;

loop_i_to_n_step:
        bgt     $t2, $t0, loop_i_to_n_end       # if (i > n) goto loop_i_to_n_end;
        mul     $t1, $t1, $t2                   # fac = fac * i;

        add     $t2, $t2, 1                     # i = i + 1;
        j       loop_i_to_n_step                # goto loop_i_to_n_step;

loop_i_to_n_end: 
        li      $v0, 1 
        move    $a0, $t0
        syscall                                 # printf("%d", n);
         
        li      $v0, 4
        la      $a0, result_msg
        syscall                                 # printf("! = ");  

        li      $v0, 1 
        move    $a0, $t2
        syscall                                 # printf("%d", fac); 

        li      $v0, 11
        li      $a0, '\n'
        syscall                                 # putchar('\n')

        li      $v0, 0      
        jr      $ra                             # return 0;                

        .data
prompt_msg:
        .asciiz "n  = "
result_msg:
        .asciiz "! = "
