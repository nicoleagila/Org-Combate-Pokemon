        .text
.globl valorMaximo

#valorMaximo
#Encuentra el valor mayor de un arreglo de flotates
#Parametros: 	registro $a0 -- arreglo de flotantes de dos valores
#Retorna: 	registro $v0 -- la posicion del valor mayor dentro del arreglo
valorMaximo:



	addi $sp, $sp, -20
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	s.s $f0, 8($sp)
	s.s $f1, 12($sp)
	s.s $f2, 16($sp)	#respalda las variables extras que van a ser usadas en la funcion

	la $s0, ($a0)		#respalda el arreglo -> $s0
	li $a1, 0
	jal indexF
	mov.s $f1, $f0		#$f1 -> floatArray[0]
 
	li $a1, 1
	la $a0, ($s0)
	jal indexF
	mov.s $f2, $f0		#$f2 -> floatArray[1]	

	c.lt.s $f2, $f1		#compara si $f2 es menor que $f1
	bc1f segundo		#salta a segundo si $f2 es mayor
	li $v0, 0		#sino, guarda el indice de $f1
	j retorno

segundo:
	li $v0, 1		#guarda en $v0 el indice de $f2
	
retorno:

	lw $s0, 0($sp)
	lw $ra, 4($sp)	
	l.s $f0, 8($sp)
	l.s $f1, 12($sp)
	l.s $f2, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra