.data
    msgINIT:    .asciiz "Inserire parametri:\n"
    msgN:       .asciiz "n: "
    msgK:       .asciiz "k: "
    msgEND:     .asciiz "\nNumero combinazioni semplici (coeff. binomiale): "

.text
#----------------------------------------------------------------------#
.globl main
.ent main
main:
    li $v0, 4
    la $a0, msgINIT
    syscall

    li $v0, 4
    la $a0, msgN
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, msgK
    syscall
    li $v0, 5
    syscall
    move $a1, $v0
    move $a0, $s0

    jal combina

    move $s0, $v0
    
    li $v0, 4
    la $a0, msgEND
    syscall
    
    move $a0, $s0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

.end main
#----------------------------------------------------------------------#
.globl combina
.ent combina
combina:
    sub $t0, $a0, $a1   # $t0 = n - k
    move $t1, $a0
    move $t2, $a1
    li $s0, 1
    li $s1, 1

mulN:                   # $s0 = (n)(n-1)(n-2)...(n-k+1)
    mult $s0, $t1
    mflo $s0
    addi $t1, $t1, -1
    bne $t1, $t0, mulN

mulD:                   # $s0 = (k)(k-1)(k-2)...(1) = k!
    mult $s1, $t2
    mflo $s1
    addi $t2, $t2, -1
    bne $t2, 0, mulD

frac:                   # $v0 = $s0 / $s1 = [(n)(n-1)(n-2)...(n-k+1)] / [k!]
    div $s0, $s1
    mflo $v0

    jr $ra

.end combina