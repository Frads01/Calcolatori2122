.data
	msg1: .asciiz "inserire primo intero:"
	msg2: .asciiz "inserire secondo intero:"
	err:  .asciiz "numeri non rappresentabili su byte"
	
.text
.globl main
.ent main
main:	li $s0, 0
		li $s1, 0
		
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 5
		syscall
		move $s0, $v0
		blt $s0, 0, ERR
		bge $s0, 256, ERR
		
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 5
		syscall
		move $s1, $v0
		blt $s1, 0, ERR
		bge $s1, 256, ERR
		

		xor $t0, $s0, $s1		#(A XOR B)
		not $s1, $s1			#(NOT B)
		and $t1, $s0, $s1		#(A AND (NOT B))
		not $t1, $t1			#NOT(A AND (NOT B))
		or $s4, $t0, $t1		#NOT(A AND (NOT B)) OR (A XOR B)
		andi $s4, $s4, 255		#valore su 8 bit
		
		li $v0, 1
		move $a0, $s4
		syscall
		j EXIT

ERR:	li $v0, 4
		la $a0, err
		syscall
		
EXIT:	li $v0, 10
		syscall