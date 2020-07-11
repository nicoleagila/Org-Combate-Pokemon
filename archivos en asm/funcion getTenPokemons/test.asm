	.data
pokemon1:      .asciiz "pikachu"
pokemon2:      .asciiz "dragonite"
pokemon3:      .asciiz "charmander"
pokemon4:	.asciiz "Bulbasaur"
type1:      .asciiz "electric"
type2:      .asciiz "fire"
type3:      .asciiz "fire"
type4:	.asciiz "leaf"
pokemons:	.word pokemon1, pokemon2, pokemon3, pokemon4
types:		.word type1, type2, type3, type4


	.text
.globl main

main:
	la $a0, pokemons
	la $a1, types
	
	jal getTenPokemons
	la $s0, ($v0)
	la $s1, ($v1)
	
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

