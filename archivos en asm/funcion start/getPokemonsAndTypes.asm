	.data
comma:	.ascii ","
r:	.ascii "\t"
void:	.ascii "\0"
word:	.space 6000
		.align 2
pokemons:	.space	440
		.align 2
types:		.space	440
	.text
.globl 	getPokemonsAndTypes
	
# $a0-> se cambia a $s0, el buffer
#$t0 -> i 
# $s1 -> word en donde guardar las palabras
# Funcion que me retorna dos arreglos paralelos $v0->Arreglo con todos los pokemones y  $v1->Areglo con todos los tipos
getPokemonsAndTypes:
	# Reservacion de sp
	addi $sp, $sp, -40
    	sw $ra, 0($sp)
    	sw $t0, 4($sp)
    	sw $t1, 8($sp)
    	sw $t2, 12($sp)
    	sw $t3, 16($sp)
    	sw $s0, 20($sp)
    	sw $s5, 24($sp)
    	sw $s6, 28($sp)
    	sw $s7, 32($sp)
    	sw $t3, 36($sp)
    	
	
	la $s6, pokemons
	la $s7, types
	
	move $s0, $a0 	#cambio de variable a el arreglo para dejar llibre $a0
	add $t0, $0, $0	#iterador i bit a bit
	add $t4, $0, $0	#iterador PARA ESCRITURA
	add $t1, $0, $0	#iterador de guardacion
	
	la $s1, word
	
whileNotComma:
	#jal heapReservation
	#move $s1, $v0
	#mover la vaina y nitocar
	move $s5, $s1
	doComma:
	add $t2, $t0, $s0	# offset + BA del buffer 
	lb $a0, 0($t2)		#obtengo el bit a comparar
	lb $a1, comma		# guardo bit para comparar
	
	jal compareBit
	
	whileComma:
	beq $v0, 0, savePokemon
	#move $s5, $s1
	add $s2, $t4, $s5
   	sb $a0, 0($s2)
   	addi $t4,$t4, 1		#aumento escitor
   	addi $t0, $t0, 1
	j doComma
	
savePokemon:
	#move $s5, $s1
	add $t3, $s6, $t1
    	sw $s5, 0($t3)
    	addi $t0, $t0, 1
    	add $t4, $0, $0		#encero mi escritor
    	j whileNotR
    	
whileNotR:
	#jal heapReservation
	#move $s1, $v0
	addi    $s1,$s1,15
	# cabiar y noticar
	move $s5, $s1
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
	
	#move $s5, $s1
	add $s2, $t4, $s5	#uso t4 para escribir
   	sb $a0, 0($s2)
   	addi $t0, $t0, 1
   	addi $t4,$t4, 1		#aumento escitor
	j doR
	
saveType:
	#move $s5, $s1
	add $t3, $s7, $t1
    	sw $s5, 0($t3)
    	addi $t0, $t0, 2	#aumento 2 para saltar en \t y \n
    	add $t4, $0, $0		#encero mi escritor
    	addi $t1, $t1, 4	#aumento en 4 el iterador de las guardaciones en types y pokemons
    	addi    $s1,$s1,15
    	j whileNotComma
 
saveLast:
	#move $s5, $s1
	add $t3, $s7, $t1
    	sw $s5, 0($t3)
    	
    	move $v0, $s6
       	move $v1, $s7
        
    	lw $ra, 0($sp)
    	lw $t0, 4($sp)
    	lw $t1, 8($sp)
    	lw $t2, 12($sp)
    	lw $t3, 16($sp)
    	lw $s0, 20($sp)
    	lw $s5, 24($sp)
    	lw $s6, 28($sp)
    	lw $s7, 32($sp)
    	lw $t4, 36($sp)
        addi $sp, $sp, 40
       	
	jr $ra	#retornar
	
