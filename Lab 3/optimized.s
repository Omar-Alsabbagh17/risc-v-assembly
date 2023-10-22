##
## Omar Alsabbagh
## 9013
## EEC 170
## Fall 2022
## Lab 3
## Estimated Instruction Count of My Program =  87 (this is just for myDiv function) and it doesn't include the main or printInput
###

.data
quot:     .string "Quotient =  "
remain:   .string "Remainder = "
dividend: .string "Dividend =  "
divisor:  .string "Divisor =  "
newln:    .string "\n"
spc:      .string "       "
thank:    .string "Thank You\n"

#These are just sample values. Your program should work for all values  0 <= X <=255 and 0 < Y <= 255
X:  .word  142       #dividend   
Y:  .word  70       #divisor    


.text
.globl main                         # make main available to all project files

main:                               # There should be one main

  
    jal printInput

    lw a1, X                        # a3 = X
    lw a2, Y                        # a4 = Y

    # Divisor is a2 and Dividend in a1, ready to go

    jal myDiv

    jal printResults  
       
# Exit Politely with a Thank You Message

    la a1   thank
    li a0, 4
    ecall
    jal zero, exit                  # Exit program


myDiv:


#return the results in registers s2, and s3 to print correctly

#Your myDiv code goes here.  

#parameters to myDiv  -- a1 is the dividend and a2 is the divisor
#ALU is 8-bit



#This code should be made as efficient as possible.
    
    # a1: dividend
    # a2: divisor
    # s2: quotient
    # s3: remainder

    slli a2, a2, 8   # since divisor needs to be initialized to the left-half of divisor register.
    add s3, a1, zero  # initialize remainder register with dividend
    addi, t0, zero, 0  # to track the current reptition
    addi t2, zero, 8   # t2 = 8 (number of repitions)

    LOOP:
        blt s3, zero ELSE
        # the if condition
        slli s3, s3, 1  #  rem_q = rem_q << 1
        sub s3, s3, a2  # rem_q = rem_q - div
        j pass_ELSE

        ELSE:
        slli s3, s3, 1  #  rem_q = rem_q << 1
        add, s3, s3, a2 # rem_q = rem_q + div

        pass_ELSE:
        blt s3, zero, CHECK_LOOP
        ori, s3, s3, 0x1  # rem_q = rem_q | 0x1

        CHECK_LOOP:
        addi, t0, t0, 1  #  rep = rep + 1
        blt t0, t2, LOOP  # goto LOOP if rep < 8
    # loop is finished
    bge s3, zero, P1
    add s3, s3, a2

    P1:
    andi s2, s3, 0xff  # quo = rem_q & 0xff
    srli s3, s3, 8  # rem = rem_q >> 8
    jalr ra              # Return to the main to print results and exit                           


# Print Routines are provided. Don't Modify!!!

printInput:
        #print dividend=
            li a0, 4
            la a1, dividend
            ecall
            li a0, 1
            lw a1, X
            ecall
            li a0, 4
            la a1, spc
            ecall

        #print divisor=
            li a0, 4
            la a1, divisor
            ecall
            li a0, 1
            lw a1, Y
            ecall
            li a0, 4
            la a1, spc
            ecall
            jalr ra

printResults:
        #print Quotient=
            li a0, 4
            la a1, quot
            ecall
            li a0, 1
            mv a1, s2
            ecall
            li a0, 4
            la a1, spc
            ecall
        #print Remainder=
            li a0, 4
            la a1, remain
            ecall
            li a0, 1
            mv a1, s3
            ecall
            li a0, 4
            la a1, newln    
            ecall
            jalr ra

exit:
    addi a0, zero, 0xA 
    ecall
