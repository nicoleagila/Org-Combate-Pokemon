.data
bienvenida:	.asciiz "Bienvenido al sistema de combates Pokémon\n\n"

.text
.globl main

#Main del programa
main:

	la $a0, bienvenida
	li $v0, 4
	syscall
	
	jal inicio
	
	li $v0,10
    syscall
