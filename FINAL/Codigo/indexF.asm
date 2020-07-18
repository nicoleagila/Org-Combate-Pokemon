
.globl indexF

#indexF
#Indexa en un arreglo de flotantes
#Parametros: 	registro $a0 -- el arreglo al que se indexara
#		registro $a1 -- el indice de la posicion donde desea indexar
#Retorna: 	registro $f0 -- el valor indexado dentro del arreglo
indexF:

	addi $sp, $sp, -12	
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	s.s $f1, 8($sp)

	sll $t1, $a1, 2		
	add $t1, $a0, $t1	
	l.s $f1, 0($t1)		
	mov.s $f0, $f1 		

	lw $t1, 0($sp)
	lw $ra, 4($sp)
	l.s $f1, 8($sp)
	addi $sp, $sp, 12

	jr $ra
