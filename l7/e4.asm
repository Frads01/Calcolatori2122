.data
    msgMAX: .asciiz "Valore massimo vettore: "
    vet: .word 4, 20, 13, 37, 6, 9, 40
    DIM = 7

.text
#----------------------------------------------------------------------#
.globl main
.ent main
main:
    la $a0, vet
    li $a1, DIM

    jal massimo

    move $s0, $v0

    li $v0, 4
    la $a0, msgMAX
    syscall
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall
    
.end main
#----------------------------------------------------------------------#
.globl massimo
.ent massimo
massimo:
    li $v0, 0
    li $t0, 0
    
loop:
    sll $t2, $t0, 2
    add $t2, $t2, $a0
    lw $s0, ($t2)
    bge $v0, $s0, continue
    move $v0, $s0

continue:
    addi $t0, $t0, 1
    bne $t0, $a1, loop

exit:
    jr $ra

.end massimo