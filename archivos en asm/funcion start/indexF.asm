
.globl indexF

#indexF
#Indexa en un arreglo de flotantes
#Parametros: 	registro $a0 -- el arreglo al que se indexara
#		registro $a1 -- el indice de la posicion donde desea indexar
#Retorna: 	registro $f0 -- el valor indexado dentro del arreglo
indexF:

	addi $sp, $sp, -12	#respalda las variables extras que van a ser usadas en la funcion
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	s.s $f1, 8($sp)

	sll $t1, $a1, 2		#t1 toma el valor del $a1(indice) * 4
	add $t1, $a0, $t1	#t1 toma el valor de la direccion de $a0(arreglo) mas $t1
	l.s $f1, 0($t1)		#f1 toma la direccion del elemento indexado
	mov.s $f0, $f1 		#retorno el valor indexado a $vo

	lw $t1, 0($sp)
	lw $ra, 4($sp)
	l.s $f1, 8($sp)
	addi $sp, $sp, 12

	jr $ra
