	.text
.globl numeroPotencia10

#numeroPotencia10
#Multiplica un numero por 10 a un exponente
#Parametros: 	registro $a0 -- numero a multiplicar
#		registro $a1 -- exponente a elevar la base 10
#Retorna: 	registro $v0 -- numero multiplicado por 10 elevado al exponente ingresado
numeroPotencia10:

		addi $sp, $sp, -32
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t6, 12($sp)
		sw $t7, 16($sp)
		sw $a0, 20($sp)
		sw $a1, 24($sp)
		sw $ra, 28($sp)

		addi $t7, $0, 10
		
		add $t0, $0, $0
		addi $t1, $0, 1
		
	for:
		slt $t6, $t0, $a1
		bne $t6, 1, fin
		mul $t1, $t1, $t7
		addi $t0, $t0, 1
		j for
		
	fin:
		mul $t1, $a0, $t1
		move $v0, $t1
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t6, 12($sp)
		lw $t7, 16($sp)
		lw $a0, 20($sp)
		lw $a1, 24($sp)
		lw $ra, 28($sp)
		addi $sp, $sp, 32
		
		jr $ra