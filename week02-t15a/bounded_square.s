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

        bgt     $t0, 46340, if_x_gt_46340       # if (x > 46340) goto if_x_gt_46340;

        mul     $t1, $t0, $t0           # y = x * x;


        li      $v0, 1
        move    $a0, $t1
        syscall                         # printf("%d", y);


        li      $v0, 11
        li      $a0, '\n'
        syscall                         # putchar('\n')

        j       finally                 # goto finally;

if_x_gt_46340:

        li      $v0, 4                  # store the value 4 in register $v0
        la      $a0, num_too_big
        syscall                         # printf("square too big for 32 bits\n"");


finally:
        li      $v0, 0                  # return 0;
        jr      $ra


        .data
enter_number:
        .asciiz "Enter a number: "

num_too_big:
        .asciiz "square too big for 32 bits\n"
