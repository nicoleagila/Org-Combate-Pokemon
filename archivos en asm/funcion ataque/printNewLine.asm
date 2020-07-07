.text

.globl printNewLine

#Parametros:    texto que va a imprimir-> $a0
printNewLine:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $v0, 4
	syscall
    

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
