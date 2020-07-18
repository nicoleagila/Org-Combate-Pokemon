.data

retroalimentacion:	.asciiz "Usted escogio el pokemon numero "
mensajeSalida:	.asciiz "Usted termino el programa con exito.\n"
archivo:   .asciiz "/home/nicoleagila/Documents/ESPOL/6s/Organizacion/Proyecto1P/Org-Combate-Pokemon/archivos en asm/funcion getPokemonsAndTypes/pokeTypes.txt"

#archivo:   .asciiz "A:\\Asus\\Documents\\Orgy\\Project\\Org-Combate-Pokemon\\archivos en asm\\funcion start\\pokeTypes.txt"

espacio: .asciiz ". "
msjsalir:	.asciiz "Salir"

.text
.globl inicio

#inicio
#Simula el ingreso de datos, y batalla entre los pokemones escogidos completa.
inicio:
	addi $sp, $sp, -56
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	sw $t0, 32($sp)
	sw $t1, 36($sp)
	sw $t2, 40($sp)
	sw $t3, 44($sp)
	sw $t4, 48($sp)
	sw $ra, 52($sp)
	

	mostrarPokemones:

	la $a0, archivo
  	jal readFile
  	
  	la $a0, ($v0)
  	
  	jal getPokemonesyTipos
  	
  	la $s1, ($v0)
  	la $s2, ($v1)
  	
  	la $a0, ($s1)
	la $a1, ($s2)
	
	jal get10Pokemones
	la $s0, ($v0)			#10 pokemones $s0
	la $s1, ($v1)			#10 tiposs $s1
	

	li $t1, 0		#indexador
	li $t3, 1		#contador
print:
	slti $t2, $t3, 11
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
		
        la $a0,retroalimentacion 				#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	addi $t4, $s2, 1
	la $a0, ($t4) 					#carga en $a0 para imprimir
	li $v0,1
	syscall
	
	jal printLn
	jal printLn
	
	jal pedirIngreso
	move $s3, $v0
	
	beq $s3, -1, quiereSalir
		
        la $a0,retroalimentacion 				#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	addi $t4, $s3, 1
	la $a0, ($t4) 					#carga en $a0 para imprimir
	li $v0,1
	syscall
	
	j enBatalla

         
	quiereSalir:
	
	jal printLn
	
	la $a0,mensajeSalida 		#Imprime la mensaje1 por pantalla
	li $v0,4
	syscall
	
	j salir

# $s2 -> indice 1
# $s3 -> indice 2
enBatalla:
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

	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $s4, 16($sp)
	lw $s5, 20($sp)
	lw $s6, 24($sp)
	lw $s7, 28($sp)
	lw $t0, 32($sp)
	lw $t1, 36($sp)
	lw $t2, 40($sp)
	lw $t3, 44($sp)
	lw $t4, 48($sp)
	lw $ra, 52($sp)
	addi $sp, $sp, 56	
         jr $ra
         

