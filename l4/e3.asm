.data
    d:          .byte   231
    h:          .byte   16
    min:        .byte   47
    risultato:  .space  4
    msgD:       .asciiz "giorni: "
    msgH:       .asciiz "ore: "
    msgMIN:     .asciiz "minuti: "

.text
.globl main
.ent main
main:   li $t0, 0
        lb $s1, min
        lb $s2, h
        lb $s3, d

        mulou $t0, $s3, 24
        add $t0, $t0, $s2

        mulou $t0, $t0, 60
        add $t0, $t0, $s1

        sw $t0, risultato

        li $v0, 1
        lw $a0, risultato
        syscall

        li $v0, 10
        syscall

.end main
