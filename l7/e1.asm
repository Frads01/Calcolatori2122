.data
    msgTRI:     .asciiz "Triangolo rettangolo isoscele di lato 8:\n"
    msgSQR:     .asciiz "\nQuadrato di lato 8:\n"
 
.text
#----------------------------------------------------------------------------------#
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msgTRI
    syscall
    jal triangle
 
    li $v0, 4
    la $a0, msgSQR
    syscall
    jal square
 
    li $v0, 10
    syscall
.ent main
#----------------------------------------------------------------------------------#
.globl triangle
.ent triangle
triangle:
    li $t0, 1
 
outerLoop1:
    beq $t0, 9, exitT
    li $t1, 0
 
innerLoop1:
    addi $t1, $t1, 1
    li $v0, 11
    li $a0, '*'
    syscall
    bne $t1, $t0, innerLoop1
 
    li $v0, 11
    li $a0, '\n'
    syscall
    addi $t0, $t0, 1
    j outerLoop1
 
exitT:
    jr $ra
.ent triangle
#----------------------------------------------------------------------------------#
.globl square
.ent square
square:
    li $t0, 1
 
outerLoop2:
    beq $t0, 9, exitS
    li $t1, 0
 
innerLoop2:
    addi $t1, $t1, 1
    li $v0, 11
    li $a0, '*'
    syscall
    bne $t1, 8, innerLoop2
 
    li $v0, 11
    li $a0, '\n'
    syscall
    addi $t0, $t0, 1
    j outerLoop2
 
exitS:
    jr $ra
.ent square
#----------------------------------------------------------------------------------#