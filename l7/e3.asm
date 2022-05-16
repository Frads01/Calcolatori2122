.data
    msgINIT:    .asciiz "Inserire parola in caratteri minuscoli: "

.text
#----------------------------------------------------------------------#
.globl main
.ent main
main:
    li $t0, 0
    la $t1, ($sp)
    li $v0, 4
    la $a0, msgINIT
    syscall

loop:
    li $v0, 12
    syscall
    move $a0, $v0
    beq $a0, '\n', continue
    addi $t0, $t0, 1
    addi $sp, $sp, -4
    jal converter
    sw $v0, ($sp)
    j loop

continue:
    li $t2, 0
    move $sp, $t1

printLoop:
    addi $t2, $t2, 1
    addi $sp, $sp, -4
    li $v0, 11
    lw $a0, ($sp)
    syscall
    bne $t2, $t0, printLoop

exit:
    move $sp, $t1
    li $v0, 10
    syscall

.end main
#----------------------------------------------------------------------#
.globl converter
.ent converter
converter:
    addi $v0, $a0, -32
    jr $ra

.end converter
#----------------------------------------------------------------------#