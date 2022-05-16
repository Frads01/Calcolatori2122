.data
    matrix:
    .word   154,    123,    109,    86,     4
    .word   412,    -23,    -231,   9,      50
    .word   123,    -24,    12,     55,     -45
    rowres: .space 12
    colres: .space 20
    msgrow: .asciiz "Somma delle righe: "
    msgcol: .asciiz "\nSomma delle colonne: "
    msgfin: .asciiz "\nTOTALE: "

.text
.globl main
.ent main
main:
    li $t0, 0       # i

    la $s0, matrix
    la $s1, rowres
    la $s2, colres
    li $s3, 0       # risultato addizione

RowSum:
    sll $t3, $t0, 2
    add $t3, $t3, $s0
    lw $t3, ($t3)

    add $s3, $s3, $t3

    addi $t0, $t0, 1
    rem $t4, $t0, 5
    bne $t4, 0, continue1

    sll $t4, $t1, 2
    add $t4, $t4, $s1
    sw $s3, ($t4)
    add $t1, $t1, 1
    addi $s3, $0, 0

continue1:
    blt $t0, 15, RowSum

    li $t1, 0
    la $a0, msgrow
    li $v0, 4
    syscall

printRow:
    sll $t3, $t1, 2
    add $t3, $t3, $s1
    lw $a0, ($t3)
    li $v0, 1
    syscall
    li $a0, ' '
    li $v0, 11
    syscall
    addi $t1, $t1, 1
    blt $t1, 3, printRow

    li $s3, 0
    li $t0, 0
    li $t2, 0

ColSum_l1:
    sll $t3, $t0, 2
    li $t1, 0

ColSum_l2:
    sll $t4, $t1, 2
    add $t4, $t4, $t3
    add $t4, $t4, $s0
    lw $t4, ($t4)

    add $s3, $s3, $t4

    addi $t1, $t1, 5
    blt $t1, 15, ColSum_l2

    sll $t5, $t2, 2
    add $t5, $t5, $s2
    sw $s3, ($t5)
    add $t2, $t2, 1
    addi $s3, $0, 0

    addi $t0, $t0, 1
    blt $t0, 5, ColSum_l1

    li $t2, 0
    la $a0, msgcol
    li $v0, 4
    syscall

printCol:
    sll $t3, $t2, 2
    add $t3, $t3, $s2
    lw $a0, ($t3)
    li $v0, 1
    syscall
    li $a0, ' '
    li $v0, 11
    syscall
    addi $t2, $t2, 1
    blt $t2, 5, printCol

    li $t1, 0
    li $t2, 0
    li $s3, 0

TotSum_rows:
    sll $t3, $t1, 2
    add $t3, $t3, $s1
    lw $t3, ($t3)
    add $s3, $s3, $t3
    addi $t1, $t1, 1
    blt $t1, 3, TotSum_rows

TotSum_cols:
    sll $t4, $t2, 2
    add $t4, $t4, $s2
    lw $t4, ($t4)
    add $s3, $s3, $t4
    addi $t2, $t2, 1
    blt $t2, 5, TotSum_cols

printTotal:
    la $a0, msgfin
    li $v0, 4
    syscall
    move $a0, $s3
    li $v0, 1
    syscall

exit:
    li $v0, 10
    syscall
.end main