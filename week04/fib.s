# .TEXT fib
        .text
fib:
        
# Arguments:
#       - $a0: int n
# Locals:
#       - $s0: int n
#
# Registers:
#       Stack:        $ra, $s0, $s1
#       Uses:         $ra, $s0, $s1, $v0, $a0     
#       Clobbers:     $a0, $v0
# Structure:
# -> fib
#       -> [prologue]
#       -> [body]
#               -> n_lt_2
#       -> [epilogue]

        begin
        push    $ra
        push    $s0
        push    $s1

fib__body:
        blt     $a0, 2, fib__n_lt_2                     #  if (n < 2) goto fib__n_lt_2;

        move    $s0, $a0

        addi    $a0, $s0, -1
        jal     fib                                     # fib(n - 1)

        move    $s1, $v0

        addi    $a0, $s0, -2
        jal     fib                                     # fib(n - 2)

        # s1 contains fib(n-1)
        # v0 contains fib(n-2)

        # v0 = fib(n-1) + fib(n-2)

        add     $v0, $s1, $v0                           # fib(n - 1) + fib(n-2)
        
        j       fib__epi                                # goto fib_epi;
        

fib__n_lt_2:
        move    $v0, $a0


fib__epi:
        pop     $s1
        pop     $s0
        pop     $ra
        end
        jr      $ra


# .TEXT main
        .text
main:

# Arguments:
#       -
# Locals:
#       - $t0: int n
#
# Registers:
#       Stack:        $ra
#       Uses:         $t0, $v0, $a0
#       Clobbers:     $t0, $v0, $a0
# Structure:
# -> main
#       -> [prologue]
#       -> [body]
#       -> [epilogue]
#
        begin
        push    $ra

main__body:
        li      $v0, 4
        la      $a0, enter_number
        syscall                                         # printf("Enter a number: ");

        li      $v0, 5
        syscall
        move    $t0, $v0                                # scanf("%d", &n)

        li      $v0, 4
        la      $a0, fib_msg_1
        syscall                                         # printf("Fibonacci of ");

        li      $v0, 1
        move    $a0, $t0
        syscall                                         # printf("%d", n);

        li      $v0, 4
        la      $a0, fib_msg_2
        syscall                                         # printf(" is ");

        move    $a0, $t0
        jal     fib

        move    $a0, $v0
        li      $v0, 1
        syscall                                         # printf("%d", fib(n))

        li      $v0, 11
        li      $a0, '\n'
        syscall                                         # putchar('\n');

main__epi:
        pop     $ra
        end
        li      $v0, 0
        jr      $ra                                     # return 0;

        .data
enter_number:
        .asciiz "Enter a number: "
fib_msg_1:      
        .asciiz "Fibonacci of "
fib_msg_2:      
        .asciiz " is "
