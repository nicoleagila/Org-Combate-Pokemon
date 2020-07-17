.data
	salto: .asciiz "\n"	
.text

.globl printLn

printLn:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	
	li $v0, 4  
	la $a0, salto      
	syscall 
    
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
