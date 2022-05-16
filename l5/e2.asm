.data
    opa:        .word   2043
    opb:        .word   5
    res:        .space  4
    msginit:    .asciiz "inserire comando (compreso tra 0 e 3): "
    msginv:     .asciiz "\ncomando inserito non valido."
    tab:        .word sum, diff, molt, divi, err
    
.text
.globl main
.ent main
main:   li $s0, 0
        li $t0, 0
        lw $s1, opa
        lw $s2, opb

        li $v0, 4
        la $a0, msginit
        syscall
        li $v0, 5
        syscall
        
        sll $v0, $v0, 2
        lw $t1, tab($v0)
        jr $t1

sum:    li $t0, '+'
        add $s0, $s1, $s2
        j print
diff:   li $t0, '-'
        sub $s0, $s1, $s2
        j print
molt:   li $t0, '*'
        mult $s1, $s2
        mflo $s0
        j print
divi:   li $t0, '/'
        div $s1, $s2
        mflo $s0
        j print

print:  li $v0, 1
        move $a0, $s1
        syscall
        li $v0, 11
        move $a0, $t0
        syscall
        li $v0, 1
        move $a0, $s2
        syscall
        li $v0, 11
        li $a0, '='
        syscall
        li $v0, 1
        move $a0, $s0
        syscall
        li $v0, 11
        li $a0, '\n'
        syscall

exit:   li $v0, 10
        syscall

.end main