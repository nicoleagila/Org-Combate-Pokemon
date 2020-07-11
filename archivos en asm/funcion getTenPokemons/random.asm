	.text
.globl random

# Retorna un numero aleatorio entre [0 y 100) en el registro $v0
random:
	#Reservacion de memoria
	addi $sp, $sp, -12 
    	sw $ra, 0($sp)
    	sw $a0, 4($sp)
    	sw $a1, 8($sp)
    
    	li $a1, 3 #Here you set $a1 to the max bound.
    	li $v0, 42 #generates the random number.
    	syscall
  	
  	li $v0, 1
  	syscall
    	move $v0, $a0
    		
    	#Liberacion de memoria
    	lw $ra, 0($sp)
    	lw $a0, 4($sp)
    	lw $a1, 8($sp)
    	addi $sp, $sp, 12 
 	
 	
    	jr $ra
