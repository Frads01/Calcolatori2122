.data
    msg1:   .asciiz "Inserire primo numero:"
    msg2:   .asciiz "\nInserire secondo numero:"

.text
.globl main
.ent main
main:
    la $a0, msg1
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    la $a0, msg2
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    sub $t1, $t2, $t1
    sub $t2, $t2, $t1
    add $t1, $t1, $t2

    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall

.end main