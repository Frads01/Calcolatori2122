.data
	msg1: 	.asciiz "inserire numero:"
	even: 	.asciiz "numero inserito pari"
	odd: 	.asciiz "numero inserito dispari"

.text
.globl main
.ent main
main:	li $s0, 0
		
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 5
		syscall
		move $s0, $v0
		
		andi $s1, $s0, 1
		bne $s1, 0, ODD
		
		li $v0, 4
		la $a0, even
		syscall
		j EXIT

ODD:	li $v0, 4
		la $a0, odd
		syscall

EXIT:	li $v0, 10
		syscall