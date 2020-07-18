.data
salto: .asciiz "\0"

.text

.globl comparaStr

#comparaStr
#Compara una cadena de texto con otra
#Parametros: 	registro $a0 -- la cadena de texto 1 a comparar
#		registro $a1 -- la cadena de texto 2 a comparar
#Retorna: 	registro $v0 -- la resta entre el ascii de las dos cadenas, 0 si son iguales.
comparaStr:

                addi $sp, $sp, -20
                sw $s0, 0($sp)
                sw $s1, 4($sp)
                sw $s2, 8($sp)
                sw $t0, 12($sp)
                sw $ra, 16($sp)
                
        while:
                lb $s2, salto
                
                lb $s0, 0($a0)
                lb $s1, 0($a1)
                
                sub $t0, $s0, $s1
                
                beq $t0, $zero, continua
                j fin

        continua:

                beq $s0	, $s2, fin
                beq $s1	, $s2, fin

                addi $a0, $a0, 1
                addi $a1, $a1, 1
                j while

        fin:
                move $v0, $t0
                
                lw $s0, 0($sp)
                lw $s1, 4($sp)
                lw $s2, 8($sp)
                lw $t0, 12($sp)
                lw $ra, 16($sp)
                addi $sp, $sp, 20
                
                jr $ra
