.data
    v1:   .word 69
    v2:   .word 420
    v3:   .word 104

.text
.globl main
.ent main
main:   lw		$t0, v1		# 
        lw		$t1, v2	        # 
        lw		$t2, v3		# 

        bgt		$t0, $t1, SAB	# if $t0 > $t1 then SAB
        bgt		$t0, $t2, SAC	# if $t0 > $t2 then SAC
        bgt		$t1, $t2, SBC	# if $t1 > $t2 then SBC

SAB:    sub $t0, $t1, $t0
        sub $t1, $t1, $t0
        add $t0, $t0, $t1
        j EXIT

SAC:    sub $t0, $t2, $t0
        sub $t2, $t2, $t0
        add $t0, $t0, $t2
        j EXIT

SBC:    sub $t1, $t2, $t1
        sub $t2, $t2, $t1
        add $t1, $t1, $t2
        j EXIT

EXIT:   li $v0, 1
        move $a0, $t0
        syscall
        li $v0, 1
        move $a0, $t1
        syscall
        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 10
        syscall
        
.end main  