.data
bienvenida:	.asciiz "Bienvenido al sistema de combates Pokémon\n\n"
feedback:	.asciiz "Usted escogio el pokemon numero "
mensajeSalida:	.asciiz "Usted termino el programa con exito.\n"
fout:   .asciiz "/home/nicoleagila/Documents/ESPOL/6s/Organizacion/Proyecto1P/Org-Combate-Pokemon/archivos en asm/funcion getPokemonsAndTypes/pokeTypes.txt"      # filename for output
espacio: .asciiz ". "
msjsalir:	.asciiz "Salir"
.text
.globl main

main:

	la $a0, bienvenida
	li $v0, 4
	syscall
  	
mostrarPokemones:
		
		
	la $a0, fout
  	jal read
  	
  	la $a0, ($v0)
  	
  	jal getPokemonsAndTypes
  	
  	la $s1, ($v0)
  	la $s2, ($v1)
  	
  	la $a0, ($s1)
	la $a1, ($s2)
	
	jal getTenPokemons
	la $s0, ($v0)			#10 pokemones $s0
	la $s1, ($v1)			#10 tiposs $s1
	

	li $t1, 0		#indexador
	li $t3, 0		#contador
print:
	slti $t2, $t3, 10
	beq $t2, $zero, opcion11
	
	la $a0, ($t3)
	li $v0, 1
	syscall
	
	la $a0, espacio
	li $v0, 4
	syscall
	
	add $t0, $s0, $t1
	li $v0, 4
	lw $a0, 0($t0)
	syscall
	
	jal     printLn	
	
	addi $t1, $t1, 4
	addi $t3, $t3, 1
	
	j print

opcion11:
	la $a0, ($t3)
	li $v0, 1
	syscall
	
	la $a0, espacio
	li $v0, 4
	syscall
	
	la $a0, msjsalir
	li $v0, 4
	syscall
	
	jal printLn
	

ingreso:
	jal pedirIngreso
	
	move $s2, $v0
	
	beq $s2, -1, quiereSalir
		
        la $a0,feedback 				#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	la $a0, ($s2) 					#carga en $a0 para imprimir
	li $v0,1
	syscall
	
	jal printLn
	jal printLn
	
	jal pedirIngreso
	move $s3, $v0
	
	beq $s3, -1, quiereSalir
		
        la $a0,feedback 				#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	la $a0, ($s3) 					#carga en $a0 para imprimir
	li $v0,1
	syscall
	
	j inBatalla

         
	quiereSalir:
	
	jal printLn
	
	la $a0,mensajeSalida 		#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	j salir

# $s2 -> indice 1
# $s3 -> indice 2
inBatalla:
		sll $t0, $s2, 2
		add $t0, $t0, $s0
		lw $s4, 0($t0)		#$s4 nombre pok1
		
		sll $t0, $s3, 2
		add $t0, $t0, $s0
		lw $s5, 0($t0)		#$s5 nombre pok2

		sll $t0, $s2, 2
		add $t0, $t0, $s1
		lw $s6, 0($t0)		#$s6 tipo pok1
		
		sll $t0, $s3, 2
		add $t0, $t0, $s1
		lw $s7, 0($t0)		#$s7 tiposs pok2
		
		la $a0, ($s4)
		la $a1, ($s5)
		la $a2, ($s6)
		la $a3, ($s7)
		
		jal batalla
		
salir:
         li $v0,10 			#termina
         syscall

