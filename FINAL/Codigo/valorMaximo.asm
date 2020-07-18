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
		s.s $f2, 16($sp)

		la $s0, ($a0)
		li $a1, 0
		jal indexF
		mov.s $f1, $f0
	
		li $a1, 1
		la $a0, ($s0)
		jal indexF
		mov.s $f2, $f0

		c.lt.s $f2, $f1
		bc1f segundo
		li $v0, 0
		j retorno

	segundo:
		li $v0, 1
		
	retorno:

		lw $s0, 0($sp)
		lw $ra, 4($sp)	
		l.s $f0, 8($sp)
		l.s $f1, 12($sp)
		l.s $f2, 16($sp)
		addi $sp, $sp, 20
		
		jr $ra
