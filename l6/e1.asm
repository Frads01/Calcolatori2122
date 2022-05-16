.data
    var: .word 3141592653
 
.text
.globl main
.ent main
main:   
    lw $t0, var
    li $t1, 10
    li $t2, 0   
    
loop_read:
    addi $sp, $sp, -4
    addi $t2, $t2, 1
    remu $t3, $t0, $t1
    sw $t3, ($sp)
    divu $t0, $t0, $t1
    bne $t3, 0, loop_read
 
loop_print:
    addi $sp, $sp, 4
    addi $t2, $t2, -1
    beq $t2, 0, exit
    lw $a0, ($sp)
    addi $a0, $a0, '0'
    li $v0, 11
    syscall
    j loop_print
 
exit:
    li $v0, 10
    syscall
    
.end main