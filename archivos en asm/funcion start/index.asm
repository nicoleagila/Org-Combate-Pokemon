
.globl index

#index
#Indexa en un arreglo de words
#Parametros: 	registro $a0 -- el arreglo al que se indexara
#		registro $a1 -- el indice de la posicion donde desea indexar
#Retorna: 	registro $v0 -- el valor indexado dentro del arreglo
index:
	addi $sp, $sp, -8
	sw $t1, 0($sp)
	sw $ra, 4($sp)
	
	sll $t1, $a1, 2		#t1 toma el valor del $a1(indice) * 4
	add $t1, $a0, $t1	#t1 toma el valor de la direccion de $a0(arreglo) mas $t1
	lw $t1, 0($t1)		#t1 toma la direccion del elemento indexado
	move $v0, $t1 		#retorno el valor indexado a $vo
	
	lw $t1, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8

	
	jr $ra			#retorno el flujo al main
