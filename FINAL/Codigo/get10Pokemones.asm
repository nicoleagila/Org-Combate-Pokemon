	.data
		.align 10
pokEscogidos:	.space 50000

		.align 10
tiposEscogidos:	.space 50000

	.text
.globl get10Pokemones

#get10Pokemones
#Crea dos arreglos paralelos los 10 pokemones escogidos con sus respectivos tipos
#Parametros: 	registro $a0 -- base del arreglo de pokemones
#		registro $a1 -- base del arreglo de tipos
#Retorna: 	registro $v0 -- base del arreglo con 10 nombres de pokemones
#		registro $v1 -- base del arreglo con los 10 tipos de pokemones correspondientes
get10Pokemones:

		addi $sp, $sp, -36 
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $s0, 20($sp)
		sw $s1, 24($sp)
		sw $s2, 28($sp)
		sw $ra, 32($sp)

		la $s1, pokEscogidos
		la $s2, tiposEscogidos
		
		jal random
		move $t0, $v0
		add $t4, $t0, 10
		
		li $t3, 0
	while:
		bgt $t0, $t4, fin
		
		sll $t1, $t0, 2
		add $t2, $t1, $a0
		lw $s0, 0($t2)
		
		add $t2, $t3, $s1
		sw $s0, 0($t2)
		
		add $t2, $t1, $a1 
		lw $s0, 0($t2)
		
		add $t2, $t3, $s2 
		sw $s0, 0($t2)
		
		addi $t0, $t0, 1
		
		addi $t3, $t3, 4
		j while
		
	fin:
		la $v0, ($s1)
		la $v1, ($s2)
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $s0, 20($sp)
		lw $s1, 24($sp)
		lw $s2, 28($sp)
		lw $ra, 32($sp)
		addi $sp, $sp, 36   	
			
		jr $ra
		
		
