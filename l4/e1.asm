.data

.text
.globl main
.ent main
main:   li $s0, 0
        li $t0, 0
        li $t4, -1

        li $v0, 12
        syscall
        beq $v0, '\n', print
        la $t0, ($v0)

loop:   li $v0, 12
        syscall

chnum:  sub $t0, $t0, '0'
        slt $t1, $t4, $t0
        slti $t2, $t0, 10
        and $t3, $t1, $t2
        beq $t3, $0, innum

        mulou $s0, $s0, 10
        addu $s0, $s0, $t0

chof:   slt $s0, 

innum:  li $v0, 12
        syscall
        beq $v0, '\n', print
        la $t0, ($v0)
        j loop

print:  li $v0, 1
        la $a0, ($s0)
        syscall
        
exit:   li $v0, 10
        syscall

.end main