	.data
fout:   .asciiz "\\A:\\Asus\\Documents\\Orgy\\Project\\Org-Combate-Pokemon\\archivos en asm\\funcion getPokemonsAndTypes\\pokeTypesLight.txt"      # filename for output

comma:	.ascii ","
r:	.ascii "\r"
void:	.ascii "\0"
		.align 2
pokemons:	.space	30
		.align 2
types:		.space	30
	.text
.globl 	main

main:
  	la $a0, fout
  	jal read
  	
  	la $a0, ($v0)
  	#li $v0, 4
  	#syscall
  	
  	jal getPokemonsAndTypes
  	
 	li $t0, 0
  	
  	lw $a0, pokemons($t0)
  	li $v0, 4
  	syscall
  	
  	lw $a0, types($t0)
  	li $v0, 4
  	syscall
  	
  	li $t0, 4
  	
  	lw $a0, pokemons($t0)
  	li $v0, 4
  	syscall
  	
  	lw $a0, types($t0)
  	li $v0, 4
  	syscall
  	
  	li $v0, 10
  	syscall

	
# $a0-> se cambia a $s0, el buffer
#$t0 -> i 
# $s1 -> word en donde guardar las palabras
# Funcion que me retorna dos arreglos paralelos $v0->Arreglo con todos los pokemones y  $v1->Areglo con todos los tipos
getPokemonsAndTypes:
	# Reservacion de sp
	addi $sp, $sp, -4
    	sw $ra, 0($sp)
	
	move $s0, $a0 	#cambio de variable a el arreglo para dejar llibre $a0
	li $t0, 0	#iterador i
	li $t1, 0	#iterador de guardacion
	
whileNotComma:
	jal heapReservation
	move $s1, $v0
	doComma:
	add $t2, $t0, $s0	# offset + BA del buffer 
	lb $a0, 0($t2)		#obtengo el bit a comparar
	lb $a1, comma		# guardo bit para comparar
	
	jal compareBit
	
	whileComma:
	beq $v0, 0, savePokemon
	
	add $s2, $t0, $s1
   	sb $a0, 0($s2)
   	addi $t0, $t0, 1
	j doComma
	
savePokemon:
    	sw $s1, pokemons($t1)
    	addi $t0, $t0, 1
    	j whileNotR
    	
whileNotR:
	jal heapReservation
	move $s1, $v0
	doR:
	add $t2, $t0, $s0	# offset + BA del buffer 
	lb $a0, 0($t2)		#obtengo el bit a comparar	
	lb $a1, void		# guardo bit para comparar
	jal compareBit
	
	whileR:
	beq $v0, 0, saveLast
	
	lb $a1, r		# guardo bit para comparar
	jal compareBit
	
	beq $v0, 0, saveType
	
	add $s2, $t0, $s1
   	sb $a0, 0($s2)
   	addi $t0, $t0, 1
	j doR
	
saveType:
    	sw $s1, types($t1)
    	addi $t0, $t0, 2	#aumento 2 para saltar en \r y \n
    	addi $t1, $t1, 4	#aumento en 4 el iterador de las guardaciones en types y pokemons
    	j whileNotComma
 
saveLast:
    	sw $s1, types($t1)
	
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        
	jr $ra	#retornar
	