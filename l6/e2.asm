.data
    checkY: .asciiz "stringa palindroma"
    checkN: .asciiz "stringa NON palindroma"
.text
.globl main
.ent main
main:   
    li $t0, 0
    la $t1, ($sp)
    li $s2, 1

loopR:
    addi $sp, $sp, -4
    addi $t0, $t0, 1
    li $v0, 12
    syscall
    beq $v0, '\n', checkPal
    sw $v0, ($sp)
    j loopR

checkPal:
    addi $t0, $t0, -1
    divu $t2, $t0, 2
    li $t0, 0
    
loopPal:
    addi $t0, $t0, 1
    addi $sp, $sp, 4
    addi $t1, $t1, -4
    lw $s0, ($sp)
    lw $s1, ($t1)
    beq $t0, $t2, printY

    beq $s0, $s1, loopPal
    la $a0, checkN
    li $v0, 4
    syscall
    j exit

printY:
    la $a0, checkY
    li $v0, 4
    syscall

exit:
    move $sp, $t1
    li $v0, 10
    syscall

.end main 