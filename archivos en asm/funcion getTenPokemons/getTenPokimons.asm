	.data
chosenOnes:	.space 5000
chosenTypes:	.space 5000

	.text
.globl getTenPokemons

getTenPokemons:
	# a0 -> Arreglo de pokemons
	# a1 -> Arreglo de tipos
	#Reservacion de memoria
	addi $sp, $sp, -28  
    	sw $t0, 0($sp)
    	sw $t1, 4($sp)
    	sw $t2, 8($sp)
    	sw $t3, 12($sp)
    	sw $t4, 16($sp)
    	sw $s0, 20($sp)
    	sw $ra, 24($sp)
    	
	la $s1, chosenOnes
	la $s2, chosenTypes
	
	jal random
	move $t0, $v0
	add $t4, $t0, 1  # +10 para saber el limite de pokemones que queremos
	
	li $t3, 0
loop:
	bgt $t0, $t4, exit
 	
 	sll $t1, $t0, 2		#offset	
 	# Cargo el pokemon
	add $t2, $t1, $a0	#offset+BA	
	lw $s0, 0($t2)
	
	# Guardo en chosenOnes
	add $t2, $t3, $s1
	sw $s0, 0($t2)
	
	# Cargo el tipo
	add $t2, $t1, $a1 
	lw $s0, 0($t2)
	
	# Guardo en chossenTypes
	add $t2, $t3, $s2 
	sw $s0, 0($t2)
	
	# Aumento en uno el iterador 
	addi $t0, $t0, 1
	# Aumento en 4 el iterador de los chosen
	addi $t3, $t3, 4
	j loop
	
exit:
	la $v0, ($s1)
	la $v1, ($s2)
	# Liberacion de memoria
    	lw $t0, 0($sp)
    	lw $t1, 4($sp)
    	lw $t2, 8($sp)
    	lw $t3, 12($sp)
    	lw $t4, 16($sp)
    	lw $s0, 20($sp)
    	lw $ra, 24($sp)
	addi $sp, $sp, 28    	
    	
	jr $ra
	
	
