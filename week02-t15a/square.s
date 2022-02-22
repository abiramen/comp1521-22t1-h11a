        .text
main:
                                        # int x in $t0
                                        # int y in $t1
        li      $v0, 4                  # store the value 4 in register $v0
        la      $a0, enter_number
        syscall                         # printf("Enter a number: ");

        li      $v0, 5                  
        syscall                         # scanf("%d", &x);
        move    $t0, $v0                # $t0 = $v0

        mul     $t1, $t0, $t0           # y = x * x;

        li      $v0, 1
        move    $a0, $t1
        syscall


        li      $v0, 11
        li      $a0, '\n'
        syscall


        li      $v0, 0                  # return 0;
        jr      $ra


        .data

enter_number:
        .asciiz "Enter a number: "
