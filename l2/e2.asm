.data
	var1:	.byte 'm'
	var2:	.byte 'i'
	var3:	.byte 'p'
	var4:	.byte 's'
	var5:	.byte 0
	
.text
.globl main
.ent main
main:
	lb $s0, var1
	lb $s1, var2
	lb $s2, var3
	lb $s3, var4
	lb $s4, var5
	
	li $t1, 'a'
	sub $t1, $t1, 'A'

	sub $s0, $s0, $t1
	sub $s1, $s1, $t1
	sub $s2, $s2, $t1
	sub $s3, $s3, $t1

	la $a0, $s0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
.end main