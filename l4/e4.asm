.data
    msgin: .asciiz "# numero: "
    msavg: .asciiz "media: "
    DIM = 3

.text
.globl main
.ent main
main:   la $s0, DIM
        li $s1, 0
        li $t0, 0

loop:   beq $t0, $s0, avg

        addi $t0, $t0, 1
        move $a0, $t0
        li $v0, 1
        syscall

        la $a0, msgin
        li $v0, 4
        syscall

        li $v0, 5
        syscall
        add $s1, $s1, $v0
        j loop

avg:    div $s1, $s0
        mflo $a0
        li $v0, 1
        syscall

exit:   li $v0, 10
        syscall


.end main