##
## Omar Alsabbagh
## 9013
## EEC 170
## Fall 2022
## Lab 2
##
.data 
    newline: .string "\n"
.text
.globl main                 # make main available to all project files
main:                       # There should be one main
    addi t1, x0, 15         # Variable a has been assigned register t1 and initializled. See line 5.

    # ==== my code =======
    
    lui  t2, 0xABC  # store 0xABC0000 in register t2
    srli t2, t2, 12 # move ABC to rightmost
    addi t2, t2, -0x2 # t2 = 0xABC - 0x2
    add  t2, t2, t1 # t2 = b = (a + t2 )

    sll  t3, t2, t1 # c = b << a, c stored in t3
    xori, t4, t3, 0xF # d = c | 0xF, d stored in t4
    
    # storing variable e in t5
    srli, t0, t1, 0x3 # t0 = a >> 0x3
    and, t5, t0, t4 # t5 = t0 and d
    addi, t0, zero, -1 # t0 = 0xffff-ffff
    xor,t5, t5, t0     # t5 = t5 ^ t0

    # store e in stack memory
    addi, sp, sp, -4 # allocate 4 bytes in sp
    sw, t5, 0(sp) # store e in sp

    # load the stored value of sp to f
    lw, t6, 0(sp)   # f stored in t6
    addi, sp, sp, 4 # deallocate 4 bytes in sp

    bge t6, t1, ELSE  # goto ELSE if f >= a
    addi, t6, t6,1    # f = f+1


    add t0, zero, t1
    add a1, zero, t0     
    jal ra, print_int       # Print a

    add t0, zero, t2
    add a1, zero, t0     
    jal ra, print_int       # Print b

    add t0, zero, t3
    add a1, zero, t0     
    jal ra, print_int       # Print c

    add t0, zero, t4
    add a1, zero, t0     
    jal ra, print_int       # Print d

    add t0, zero, t5
    add a1, zero, t0     
    jal ra, print_int       # Print e

    add t0, zero, t6
    add a1, zero, t0     
    jal ra, print_int       # Print f

    jal zero, exit          # Exit program
   
    ELSE: addi, t6, t6, -1 

    


print_int:                  # prints "x\n" where x is an integer in a1
    addi a0, zero, 0x1      # Setup ecall for print int
    ecall                   # ecall print int
    addi a0, zero, 0x4      # Setup ecall for string printing
    la a1 newline           # Load address of newline string
    ecall                   # ecall newline string
    jalr zero, ra, 0x0      # return


exit:
    addi a0, zero, 0xA      # Setup exit ecall
    ecall                   # ecall to exit