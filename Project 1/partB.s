li a0, 0x100
la s0, logo
li s2, 0
li s3, 10



outer:
li s1, 0
inner:
lw a2, 0(s0)
slli a1, s2, 16
or a1, a1, s1
ecall
addi s0, s0, 4
addi s1, s1, 1
bne s1, s3, inner
addi s2, s2, 1
bne s2, s3, outer
li a0, 10
li a1, 0
ecall


.data
logo:
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F # 5
.word 0x0000FF7F
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000
.word 0x00000000 # 10
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000 #15
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000 #20
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000 # 25
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000 # 30
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000 # 35
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000 # 40
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F # 45
.word 0x0000FF7F
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000
.word 0x00000000 # 50
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000 # 55
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000 #60
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x0000FF7F # 65
.word 0x0000FF7F
.word 0x0000FF7F
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000 #70
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000 #75
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000 #80
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000 #85
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000 #90
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x0000FF7F
.word 0x0000FF7F #95
.word 0x0000FF7F
.word 0x0000FF7F
.word 0x0000FF7F
.word 0x00000000
.word 0x00000000 #100