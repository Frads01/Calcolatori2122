.data
        msgerr: .asciiz "overflow: numero non rappresentabile su 4 byte"

.text
.globl main
.ent main
main:   li $s0, 0
        li $t0, 0
        li $t4, -1

        li $v0, 12
        syscall
        la $t0, ($v0)
        li $v0, 1
        move $a0, $t0
        syscall
        beq $t0, '\n', exit

loop:   li $v0, 12
        syscall

chnum:  sub $t0, $t0, '0'
        slt $t1, $t4, $t0
        slti $t2, $t0, 10
        and $t3, $t1, $t2
        beq $t3, $0, innum

molt:   mulou $s0, $s0, 10
        addu $s0, $s0, $t0

innum:  li $v0, 12
        syscall
        beq $v0, '\n', c4b
        la $t0, ($v0)
        li $v0, 1
        move $a0, $t0
        syscall
        j loop

c4b:    slti $t1, $s0, 4294967295
        beq $t1, $0, print
        li $v0, 4
        la $a0, msgerr
        syscall
        j exit

print:  li $v0, 1
        la $a0, ($s0)
        syscall
        
exit:   li $v0, 10
        syscall

.end main