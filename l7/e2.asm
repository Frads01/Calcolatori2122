.data
    msgTRI:     .asciiz "\nTriangolo rettangolo isoscele di lato "
    msgSQR:     .asciiz "\nQuadrato di lato "
    msgDIM:     .asciiz "Inserire dimensione lato: "
    msgEND:     .asciiz ":\n"
 
.text
#----------------------------------------------------------------------------------#
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msgDIM
    syscall
 
    li $v0, 5
    syscall
    move $s0, $v0
 
    li $v0, 4
    la $a0, msgTRI
    syscall
    li $v0, 1
    move $a0, $s0
    syscall
    li $v0, 4
    la $a0, msgEND
    syscall
 
    move $a0, $s0
    jal triangle
 
    li $v0, 4
    la $a0, msgSQR
    syscall
    li $v0, 1
    addi $s0, $s0, -1
    move $a0, $s0
    syscall
    li $v0, 4
    la $a0, msgEND
    syscall
 
    move $a0, $s0
    jal square
 
    li $v0, 10
    syscall
.ent main
#----------------------------------------------------------------------------------#
.globl triangle
.ent triangle
triangle:
    li $t0, 1
    move $s0, $a0
    addi $s0, $s0, 1
 
outerLoop1:
    beq $t0, $s0, exitT
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
    move $s0, $a0
    addi $s1, $s0, 1
 
outerLoop2:
    beq $t0, $s1, exitS
    li $t1, 0
 
innerLoop2:
    addi $t1, $t1, 1
    li $v0, 11
    li $a0, '*'
    syscall
    bne $t1, $s0, innerLoop2
 
    li $v0, 11
    li $a0, '\n'
    syscall
    addi $t0, $t0, 1
    j outerLoop2
 
exitS:
    jr $ra
.ent square
#----------------------------------------------------------------------------------#