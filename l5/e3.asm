.data
    v1:         .word 1, -2, -3, 4
    v2:         .word -5, 6, -8, 10
    mat:        .space 64

.text
.globl main
.ent main                               #               per l'indirizzo
main:   addi $t0, $0, 0                 # i (v1)              $t3
        addi $t1, $0, 0                 # j (v2)              $t4
        addi $t2, $0, 0                 # k (mat)             $t5

        la $s0, v1
        la $s1, v2
        la $s2, mat
        li $s3, 0                       # risulatato moltiplicazione v1[i] * v2[j]

v1r:    
        sll $t3, $t0, 2                 # ($t3) = i * 4
        add $t3, $t3, $s0               # ($t3) = $s0 + i * 4
        lw $t3, ($t3)                   # ValReg $t3 = ValReg con indirizzo $s0 + i * 4
        
        addi $t1, $0, 0
v2c:            
                sll $t4, $t1, 2
                add $t4, $t4, $s1
                lw $t4, ($t4)

                mult $t3, $t4           
                mflo $s3

                sll $t5, $t2, 2
                add $t5, $t5, $s2
                sw $s3, ($t5)

                addi $t2, $t2, 1
                addi $t1, $t1, 1 
                bne $t1, 4, v2c

        addi $t0, $t0, 1 
        bne $t0, 4, v1r

        li $t2, 0

print:  
        sll $t5, $t2, 2
        add $t5, $t5, $s2

        lw $a0, ($t5)
        li $v0, 1
        syscall
        li $a0, '\t'
        li $v0, 11
        syscall

        addi $t2, $t2, 1
        
        li $t0, 4
        div $t2, $t0
        mfhi $t0
        bne $t0, 0, continue
        li $a0, '\n'
        li $v0, 11
        syscall

continue:
        bne $t2, 16, print

exit:   li $v0, 10
        syscall
        
.end main