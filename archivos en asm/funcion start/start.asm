.data
feedback:	.asciiz "Usted escogio el pokemon numero "
mensajeSalida:	.asciiz "Usted termino el programa con exito.\n"
fout:   .asciiz "/home/nicoleagila/Documents/ESPOL/6s/Organizacion/Proyecto1P/Org-Combate-Pokemon/archivos en asm/funcion getPokemonsAndTypes/pokeTypes.txt"      # filename for output

.text
.globl main

main:
  	
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
	la $s0, ($v0)			#10 pokemones
	la $s1, ($v1)			#10 tiposs
								#PROBANDO
	addi $t0, $s0, 0
	jal     printLn
	li $v0, 4
	lw $a0, 0($t0)
	syscall
	
	addi $t0, $s0, 4
	jal     printLn
	li $v0, 4
	lw $a0, 0($t0)
	syscall
	
	addi $t0, $s1, 0
	jal     printLn
	li $v0, 4
	lw $a0, 0($t0)
	syscall
	
	addi $t0, $s1, 4
	jal     printLn
	li $v0, 4
	lw $a0, 0($t0)
	syscall
	
	li $v0, 10
	syscall
		j done

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
done:
salir:
         li $v0,10 			#termina
         syscall

