.data
    v:      .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    pit:    .space 400
    MAX = 10

.text
.globl main
.ent main
main:   
    li $t0, 0       # riga,       $t3 per indirizzo
    li $t1, 0       # colonna,    $t4 per indirizzo
    li $t2, 0       # matrice,    $t5 per indirizzo

    la $s0, pit
    la $s1, v
    li $s2, 0       #result i*j

row:   
    sll $t3, $t0, 2
    add $t3, $t3, $s1
    lw $t3, ($t3)
    li $t1, 0

col:
        sll $t4, $t1, 2
        add $t4, $t4, $s1
        lw $t4, ($t4)
        
        mult $t3, $t4
        mflo $s2

        sll $t5, $t2, 2
        add $t5, $t5, $s0
        sw $s2, ($t5)

        addi $t2, $t2, 1
        addi $t1, $t1, 1
        bne $t1, MAX, col
    
    addi $t0, $t0, 1
    bne $t0, MAX, row

    li $t2, 0

print:  
    sll $t5, $t2, 2
    add $t5, $t5, $s0

    lw $a0, ($t5)
    li $v0, 1
    syscall
    li $a0, '\t'
    li $v0, 11
    syscall

    addi $t2, $t2, 1
        
    li $t0, 10
    div $t2, $t0
    mfhi $t0
    bne $t0, 0, continue
    li $a0, '\n'
    li $v0, 11
    syscall

continue:
        bne $t2, 100, print

exit:   li $v0, 10
        syscall
        

.end main
