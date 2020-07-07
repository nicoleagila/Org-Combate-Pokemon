    .data
pokemon1:      .asciiz "pikachu"
pokemon2:      .asciiz "dragonite"
nombres:	.word pokemon1, pokemon2
indices: 	.word 0,1
vida: 		.float 5.0,5.0
ataques: 	.float 1.0,2.0

    .text
    
.globl main

main:
	#Parametros:    indices-> $a0, nombre -> $a1, vida ->$a2, ataque -> $a3
	la $a0, indices
	la $a1, nombres
	la $a2, vida
	la $a3, ataques
	
	jal ataque
	
	li $v0, 10
	syscall			#salir del programa
