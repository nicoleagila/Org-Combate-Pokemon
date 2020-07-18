.data
	.eqv TAMANO 10
ingreso: .space TAMANO
mensajePedir:	.asciiz "\nIngrese un pokemon del 1 al 10 (11 para salir).\n-> "

.text
.globl pedirIngreso

#pedirIngreso
#Pide al usuario que ingrese un numero entre un rango, continua hasta que el usuario no ingrese correctamente el numero
#Retorna: 	registro $v0 -- el numero del pokemon que ingreso el usuario, si ingresa la opcion de salir, retorna -1
pedirIngreso:

		addi $sp, $sp, -20
		sw $a0, 0($sp)
		sw $a1, 4($sp)
		sw $s0, 8($sp)
		sw $t0, 12($sp)
		sw $ra, 16($sp)
		
	pedir:
		la $a0,mensajePedir
		li $v0,4
		syscall

		li $v0,8
		la $a0, ingreso
		li $a1, TAMANO
		syscall
		
		la $a0, ingreso
		
		jal strEsDigito
		
		beq $v0, $zero, pedir
		
		la $a0, ingreso
		jal parseInt
		
		addi $v0, $v0, -1
		move $s0, $v0

	comparaRango:

		li  $t0, 0
		beq $s0, 10, salida
		
		bltu   $s0 ,$t0, pedir
		
		li  $t0, 10
		bltu $t0 ,$s0, pedir
		
		move $v0, $s0
		j fin

	salida:
		li $v0, -1
	fin:

		lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $s0, 8($sp)
		lw $t0, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		jr $ra
