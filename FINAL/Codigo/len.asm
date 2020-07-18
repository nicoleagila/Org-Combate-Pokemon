	.data
salto: 	.asciiz "\n"
	.text
.globl len

#len
#Calcula la longitus de una cadena de texto
#Parametros: 	registro $a0 -- la cadena de texto a contar
#Retorna: 	registro $v0 -- la logitud de la cadena ingresada
len:
	
		addi $sp, $sp, -20
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $a0, 12($sp)
		sw $ra, 16($sp)
		
		add $t0, $0, $0	
		
	while:
		add $t1, $a0, $t0
		lb $t1, ($t1)	
		lb $t2, salto
		beq $t1, $t2, retorno
		addi $t0, $t0, 1
		j while
		
		
	retorno:
		move $v0, $t0
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $a0, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		jr $ra


