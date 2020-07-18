.text
.globl strEsDigito

#strEsDigito
#Verifica si la cadena de texto ingresada es un numero o no.
#Parametros: 	registro $a0 -- la direccion inicial a una cadena de texto
#Retorna: 	registro $v0 -- 1 si la cadena de texto es un numero, si no 0
strEsDigito:

		addi $sp, $sp, -20
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $ra, 16($sp)

		la $t0, ($a0)
		li $t3, 0
		li $t2, 1

	do:

		add $t1, $t3, $t0
		lb $t1, 0($t1)
		beq $t1, 13 , compararPrimero  	#\d
		beq $t1, 10 , compararPrimero 	#\n

	while:
		beq $t1, 10 , fin 				#\n

		move $a0, $t1
		jal bitEsDigito	
		and $t2, $t2, $v0
		addi $t3, $t3, 1

		j do

		compararPrimero:
		bne $t3, 0, fin
		andi $t2, $t2, 0

	fin:
		move $v0, $t2

		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		jr $ra
