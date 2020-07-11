.data
	salto: .asciiz "\n"	
.text

.globl printLn

printLn:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	li $v0, 4  
	la $a0, salto      
	syscall 
    
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra