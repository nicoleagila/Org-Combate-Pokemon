.data
salto: .asciiz "\0"

.text

.globl compareString

#compara si dos string son iguales
#parametros: string1 -> $a0, string2 ->$a1	
#retorna valor de la resta entre palabras, 0 si son iguales, otro numero si son diferentes
compareString:

	addi $sp, $sp, -20
	sw $s0, 0($sp)
	sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $t0, 12($sp)
        sw $ra, 16($sp)
        

bucle:
	lb $s2, salto			#carga el salto de linea
	
        lb $s0, 0($a0)			#carga el primer caracter del string1
        lb $s1, 0($a1)			#carga el primer caracter del string2
        
        sub $t0, $s0, $s1		#resta ambos caracteres
        
        beq $t0, $zero, continua	#verifica si son iguales (resta = 0) y continua
        j fin

continua:

        beq $s0	, $s2, fin		#verifica si alguna de las dos palabras terminaron
        beq $s1	, $s2, fin
					#continua
        addi $a0, $a0, 1		#aunmenta ambas direcciones en 1 para volver a comparar
        addi $a1, $a1, 1
        j bucle

fin:
        move $v0, $t0
        
	lw $s0, 0($sp)
	lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $t0, 12($sp)
        lw $ra, 16($sp)
        addi $sp, $sp, 20
        
        jr $ra
