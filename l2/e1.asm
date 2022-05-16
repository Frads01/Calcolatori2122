.data
	n1:		.byte 10
	n2:		.byte 0x10
	n3:		.byte '1'
	res:	.space 1
	
.text
.globl main
.ent main
main:
	lb $t0, n1
	lb $t1, n2
	lb $t2, n3
	li $s0, 0
	add $s0, $s0, $t0
	sub $s0, $s0, $t1
	add $s0, $s0, $t2
	sb $s0, res
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall
.end main