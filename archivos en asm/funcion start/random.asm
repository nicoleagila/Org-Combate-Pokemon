	.text
.eqv LIMITE_SUPERIOR	100
.globl random

#random
#Genera un numero aleatorio en un rango determinado
#Retorna: 	registro $v0 -- el numero random entre 0 y 100S
random:
	#Reservacion de memoria
	addi $sp, $sp, -12 
    	sw $ra, 0($sp)
    	sw $a0, 4($sp)
    	sw $a1, 8($sp)
    
    	li $a1, LIMITE_SUPERIOR #Here you set $a1 to the max bound.
    	li $v0, 42 #generates the random number.
    	syscall

    	move $v0, $a0
    		
    	#Liberacion de memoria
    	lw $ra, 0($sp)
    	lw $a0, 4($sp)
    	lw $a1, 8($sp)
    	addi $sp, $sp, 12 
 	
    	jr $ra
