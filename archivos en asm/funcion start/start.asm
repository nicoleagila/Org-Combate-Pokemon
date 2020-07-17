.data
feedback:	.asciiz "Usted escogio el pokemon numero "
mensajeSalida:	.asciiz "Usted termino el programa con exito.\n"

.text
#.globl main

#main:
#	jal readFile
mostrarPokemones:
		#10poketypes
		#mostrar 10 pokemones

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
	
	beq $s1, -1, quiereSalir
		
        la $a0,feedback 				#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	la $a0, ($s1) 					#carga en $a0 para imprimir
	li $v0,1
	syscall
	
	j salir

         
	quiereSalir:
	
	jal printLn
	
	la $a0,mensajeSalida 		#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall

# $s0 -> indice 1
# $s1 -> indice 2
batalla:

		#indexar tipo y nombres para tener 2 pokemones
#		jal batalla

salir:
         li $v0,10 			#termina
         syscall

