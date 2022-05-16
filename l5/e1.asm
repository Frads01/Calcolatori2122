.data
    fib: .space 80
    NUM = 20

.text
.globl main
.ent main
main:   li $t0, 1           #contatore
        li $t1, 0           #valore 1
        li $t2, 1           #valore 2
        li $t3, 0           #valore 1+2
        la $s0, fib         #indirizzo iniziale array

        sw $t2, ($s0)       #array[0] = 1
loop:   beq $t0, NUM, exit 
        
        add $t3, $t2, $t1
        move $t1, $t2
        move $t2, $t3

        sll $t4, $t0, 2
        addi $t4, $t4, $s0
        sw $t3, ($s4)

        add $t0, $t0, 1     #i = i + 1
        j loop;

exit:   li $v0, 10
        syscall

.end main