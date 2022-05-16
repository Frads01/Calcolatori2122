.data
    var: .word 0x3FFFFFF0

.text
.globl main
.ent main
main:

    lw $t0, var
    sll $t1, $t0, 1
    li $v0, 1
    move $a0, $t1
    syscall

    move $s0, $t1
    addiu $s0, $s0, 40
    li $v0, 1
    move $a0, $s0
    syscall

    move $s1, $t1
    li $t2, 40
    addu $s1, $s1, $t2
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall
.end main