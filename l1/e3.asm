##################################################
# Scrittura di un valore in una cella di memoria #
##################################################

.data
var: .space 4 				# int variabile

.text
.globl main
.ent main
main:	li $t0, 19591501	# var = 19591501 (0x012AF14D)
		sw $t0, var
		
		li $v0, 10
		syscall
.end main