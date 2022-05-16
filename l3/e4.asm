.data
	var1:	.half	68

.text
.globl main
.ent main
main:	lh $t0, var1
	    li $t1, 0
		li $s0, 0
		li $s1, 16

loop: 	bge $t1, $s1, EXIT
	    andi $t3, $t0, 1		# verifica se bit=1
		bne $t3, 1, L1			# se vero, incremento contatore
		addi $s0, $s0, 1		# 
L1:	  	srl $t0, $t0, 1			# shift a destra -> passo al bit successivo
		addi $t1, $t1, 1		# incremento contatore del for
		j loop;					# fine ciclo, ritorno a "loop"

EXIT: 	li $v0, 1
		move $a0, $s0
		syscall

		li $v0, 10
	    syscall

.end main