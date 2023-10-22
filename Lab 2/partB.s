##
## Omar Alsabbagh
## 9013
## EEC 170
## Fall 2022
## Lab 2
##

.data 
    encipher_str:   .string "Ciphertext: "
    decipher_str:   .string "Plaintext: "
    newline:        .string "\n"
    cText:          .byte   0x61 0x4f 0x2c 0x50 0x6d 0x02 0x75 0x7f 0x2c 0x51 0x51 0x4f 0x2c 0x3d 0x43 0x3c 0x00
    
.text
.globl main                         # make main available to all project files

main:                               # There should be one main
    addi s0, zero, 0xC              # k = 12
    la a1 encipher_str              # Load address to "Ciphertext: " string
    la a2 cText                     # Load address to cText string
    jal ra, print_msg               # Print "Ciphertext: cText"
    # Rest of your program goes here

    
    addi, sp, sp, -17  # allocate 17 bytes in sp for storing pText
    addi, s1, sp, 0    # store base address of the array in s1
    la s2 cText   # store base address of cText in s2
    addi, t0, zero, 0  # t0  = 0,  t0 will be used as varaible "i" 

    lb t1, 0(s2)  # t1 = cText[0], t1 will be used to traverse cText
    addi, t5, zero, 128  # t5 = 128
    andi t6, s0, 127 # t6 = k&(128-1) -> k%128
    sub, s3, t5, t6  # s3 = decrypt_const variable

    loop:
    beq t1, zero, end_while
    add t3, t1, s3  # t3 = cText[i] + decrypt_const
    andi t3, t3, 127   # t3 = t3 % 128
    add t4, t0, s1   # t4 = &pText[i]
    sb, t3, 0(t4)
    addi, t0, t0, 1  # i++
    add t2, t0, s2   # t2 = &cText[i], t2 used to travese address of Ptext
    lb t1, 0(t2)     # t1 = *(t2)
    jal zero, loop   # jump to loop


    end_while:
    add t4, t0, s1
    sb zero, 0(t4)  # pText[16] = 0x00

    la a1 decipher_str              # Load address of "Plaintext: " string
    mv a2, zero                     # clear a2
    addi a2, s1, 0                  # Load base address of pText into a2
    jal ra, print_msg               # Print
    addi, sp, sp, 17                # deallocate 17 bytes from SP
    jal zero, exit                  # Exit program


print_msg:                          # prints "%s%s\n"
    addi a0, zero, 0x4              # Setup ecall for print string
    ecall                           # ecall first string
    add a1, a2, zero                # print secondary string
    ecall                           # ecall second string
    la a1 newline                   # print newline string
    ecall                           # ecall newline string
    jalr zero, ra, 0x0              # return

exit:
    addi a0, zero, 0xA      # Setup exit ecall
    ecall                   # ecall to exit