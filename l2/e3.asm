.data
    op1:    .byte 150
    op2:    .byte 100

.text
.globl main
.ent main
main:
    lbu $s0, op1
    lbu $s1, op2
    li $s2, 0
    add $s2, $s0, $s1
    move $a0, $s2
    li $v0, 1
    syscall

    li $v0, 10
    syscall    
.end main