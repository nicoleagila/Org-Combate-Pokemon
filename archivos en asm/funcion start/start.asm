.data
feedback:	.asciiz "Usted escogio el pokemon numero "
mensajeSalida:	.asciiz "Usted termino el programa con exito.\n"

.text
.globl main

main:

mostrarPokemones:


ingreso:
	jal pedirIngreso
	
	move $s0, $v0
	
	beq $s0, -1, quiereSalir
		
        la $a0,feedback 				#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	la $a0, ($s0) 					#carga en $a0 para imprimir
	li $v0,1
	syscall
	
	jal printLn
	
	jal pedirIngreso
	move $s0, $v0
	
	beq $s0, -1, quiereSalir
		
        la $a0,feedback 				#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	la $a0, ($s0) 					#carga en $a0 para imprimir
	li $v0,1
	syscall
	
	j salir

         
	quiereSalir:
	
	jal printLn
	
	la $a0,mensajeSalida 		#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall


batalla:

	
salir:
         li $v0,10 			#termina
         syscall

