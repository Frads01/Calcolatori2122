.data
    atxt:       .asciiz "A: "
    btxt:       .asciiz "B: "
    ctxt:       .asciiz "C: "
    startText:  .asciiz "Inserire termini equazione:\n"
    checkYD:    .asciiz "L'equazione ha soluzioni reali coincidenti.\n"
    checkY:     .asciiz "L'equazione ha soluzioni reali.\n"
    checkN:     .asciiz "L'equazione non ha soluzioni reali.\n"

.text
.globl main
.ent main
main:
    li $s0, 0
    li $s1, 0
    li $s2, 0

    la $a0, startText
    li $v0, 4
    syscall

    la $a0, atxt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    la $a0, btxt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    la $a0, ctxt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $s2, $v0

checkDisc:
    mulo $t0, $s1, $s1
    mulo $t1, $s0, $s2
    sll $t1, $t1, 2
    sub $t0, $t0, $t1
    beq $t0, 0, realDouble
    slt $t1, $t0, 0
    bne $t1, 1, real

notReal:
    la $a0, checkN
    li $v0, 4
    syscall
    j exit

real:
    la $a0, checkY
    li $v0, 4
    syscall
    j exit

realDouble:
    la $a0, checkYD
    li $v0, 4
    syscall

exit:
    li $v0, 10
    syscall

.end main