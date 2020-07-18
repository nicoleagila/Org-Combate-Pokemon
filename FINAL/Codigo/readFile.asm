        .data
.eqv	tamano	2048
buffer: .space tamano

        .text
.globl 	readFile

#readFile
#Lee un archivo de texto
#Parametros: 	registro $a0 -- direccion donde se encuentra el archivo a leer
#Retorna: 	registro $v0 -- buffer con el texto del archivo cargado en memoria
readFile:

  	addi $sp, $sp, -20 
	sw $t0, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a0, 12($sp)
	sw $ra, 16($sp)
    	
  	li $v0, 13
  	li $a1, 0
  	syscall

  	move $t0, $v0
  
  	li $v0, 14
  	la $a1, buffer
  	li $a2, tamano
  	move $a0, $t0 
  	syscall

  	li $v0, 16
  	move $a0, $t0
  	syscall

  	la $v0, buffer
  
	lw $t0, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $a0, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20 
  	jr $ra

