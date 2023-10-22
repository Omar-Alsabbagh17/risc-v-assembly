nop
# lui t1, 0x0f000
# lui t2, 0xf0000
sw x5, 0(x6)
lw x7, 0(x6)
sb x5, 3(x6)
lw x7, 0(x6)
nop

# ##
# ## Omar Alsabbagh
# ## 9013
# ## EEC 170
# ## Fall 2022
# ## Lab 3
# ## Estimated Instruction Count of My Program = 
# ###

# .data
# quot:     .string "Quotient =  "
# remain:   .string "Remainder = "
# dividend: .string "Dividend =  "
# divisor:  .string "Divisor =  "
# newln:    .string "\n"
# spc:      .string "       "
# thank:    .string "Thank You\n"

# #These are just sample values. Your program should work for all values  0 <= X <=255 and 0 < Y <= 255
# X:  .word  250       #dividend   
# Y:  .word  120       #divisor    


# .text
# .globl main                         # make main available to all project files

# main:                               # There should be one main

  
#     jal printInput

#     lw a1, X                        # a3 = X
#     lw a2, Y                        # a4 = Y

#     # Divisor is a2 and Dividend in a1, ready to go

#     jal myDiv

#     jal printResults  
       
# # Exit Politely with a Thank You Message

#     la a1   thank
#     li a0, 4
#     ecall
#     jal zero, exit                  # Exit program


# myDiv:

# #Your myDiv code goes here.  


# #parameters to myDiv  -- a1 is the dividend and a2 is the divisor
# #ALU is 16-bit
# #return the quotient in registers s2, and  remainder in s3 to print correctly
     
#      # a1: dividend
#      # a2: divisor
#      # s2: quotient
#      # s3: remainder

#     addi s2, zero, 0  # initialize quotient to 0
#                       # I noticed s2 is not used by main, so I didn't save the  value of s2 into stack
#                       # in effort to reduce instruction count

#     slli a2, a2, 8   # since divisor needs to be initialized to the left-half of divisor register.
#     add s3, a1, zero  # initialize remainder register with dividend
#     addi, t0, zero, 0  # to track the current reptition
#     addi t2, zero, 9   # t2 = 9 (number of repitions)

#     LOOP:
#     sub s3, s3, a2   # rem = rem - div
#     srli t1, s3, 31  # isolate the sign bit
#     slli s2, s2, 1   # quo = quo << 1
#     beq t1, zero,  POSITIVE   # if result of subtraction  (rem - div) is positive
#     add s3, s3, a2
#     jal x0, END_IF_ELSE
    
#     POSITIVE: 
#     # quo = quo | 0x01;
#     addi s2, s2, 1

#     END_IF_ELSE:
#     srli a2, a2, 1  # div = div >> 1
#     addi t0, t0, 1  # reptition = reption + 1

#     blt t0, t2, LOOP

#     jalr ra              # Return to the main to print results and exit    



# printInput:
#         #print dividend=
#             li a0, 4
#             la a1, dividend
#             ecall
#             li a0, 1
#             lw a1, X
#             ecall
#             li a0, 4
#             la a1, spc
#             ecall

#         #print divisor=
#             li a0, 4
#             la a1, divisor
#             ecall
#             li a0, 1
#             lw a1, Y
#             ecall
#             li a0, 4
#             la a1, spc
#             ecall
#             jalr ra

# printResults:
#         #print Quotient=
#             li a0, 4
#             la a1, quot
#             ecall
#             li a0, 1
#             mv a1, s2
#             ecall
#             li a0, 4
#             la a1, spc
#             ecall
#         #print Remainder=
#             li a0, 4
#             la a1, remain
#             ecall
#             li a0, 1
#             mv a1, s3
#             ecall
#             li a0, 4
#             la a1, newln    
#             ecall
#             jalr ra

# exit:
#     addi a0, zero, 0xA 
#     ecall
