	.data
fout:   .asciiz "\\A:\\Asus\\Documents\\Orgy\\Project\\Org-Combate-Pokemon\\archivos en asm\\funcion getPokemonsAndTypes\\pokeTypesLight.txt"      # filename for output


comma:  .asciiz ","
word:	.space  20000       # [NEW]

		.align 2
pokemons:	.space	8
		.align 2
types:		.space	8
	
	.text
#.globl 	main

main:
  	la $a0, fout
  	jal read
  	
  	la $a0, ($v0)
  	#li $v0, 4
  	#syscall
  	
  	jal getPokemonsAndTypes
  
  	li $v0, 10
  	syscall

# $a0 -> El texto del archivo en un buffer
# Funcion que me retorna dos arreglos paralelos $v0->Arreglo con todos los pokemones y  $v1->Areglo con todos los tipos
getPokemonsAndTypes:
	#Reservacion de memoria
  	addi $sp, $sp, -20 
    	sw $t0, 0($sp)
    	sw $a1, 4($sp)
    	sw $a2, 8($sp)
    	sw $a0, 12($sp)
    	sw $ra, 16($sp)
    	
    	la $s2, word
    	
  	li $s0, 0  	
   	lb $t0, 0($a0)
   	add $s1, $s0, $s2
    	sb $t0, 0($s1)
    	
    	addi $s0, $s0, 1
    	lb $t0, 1($a0)
    	add $s1, $s0, $s2
    	sb $t0, 0($s1)
    	
    	addi $s0, $s0, 1
    	lb $t0, 2($a0)
    	add $s1, $s0, $s2
    	sb $t0, 0($s1)
    	
    	addi $s0, $s0, 1
    	lb $t0, 3($a0)
    	add $s1, $s0, $s2
    	sb $t0, 0($s1)
    	
    	addi $s0, $s0, 1
    	lb $t0, 4($a0)
    	add $s1, $s0, $s2
    	sb $t0, 0($s1)
    	
    	# Validar si bit es ","
    	# saltarse la coma
    	
   	
    	#Guardar word en pokemons
    	
    	li $t0,0
    	move $s6, $s2
    	sw $s6, pokemons($t0)
    	
    	
    	# go to recorrer para tipos
    	
    	#advance word into 20
    	addi    $s2,$s2,20
    	
    	#Recorres despues de la coma
    	li $s0, 0  	
   	lb $t0, 6($a0)
   	add $s1, $s0, $s2
   	sb $t0, 0($s1)
   	
   	addi $s0, $s0, 1	
   	lb $t0, 7($a0)
	add $s1, $s0, $s2
   	sb $t0, 0($s1)
   	
   	addi $s0, $s0, 1	
   	lb $t0, 8($a0)
	add $s1, $s0, $s2
   	sb $t0, 0($s1)
   	
   	addi $s0, $s0, 1	
   	lb $t0, 9($a0)
	add $s1, $s0, $s2
   	sb $t0, 0($s1)
   	
   	addi $s0, $s0, 1	
   	lb $t0, 10($a0)
	add $s1, $s0, $s2
   	sb $t0, 0($s1)
   	
   	#Bit es \n
   	# saltarse la \n
   	#Guardar word en types
    	li $t0,0
    	move $s6, $s2
    	sw $s6, types($t0)
    	
    	lw $a0, pokemons($t0)
    	li $v0, 4
    	syscall
    	
    	lw $a0, types($t0)
    	li $v0, 4
    	syscall
    	
    	#Liberacion de memoria
    	lw $t0, 0($sp)
    	lw $a1, 4($sp)
    	lw $a2, 8($sp)
    	lw $a0, 12($sp)
    	lw $ra, 16($sp)
    	addi $sp, $sp, 20 
  	jr $ra
	
	
	
	
	
	
	
	
	
