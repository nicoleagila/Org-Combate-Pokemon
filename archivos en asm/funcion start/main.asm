.data
bienvenida:	.asciiz "Bienvenido al sistema de combates Pokémon\n\n"

.text
.globl main
main:

	la $a0, bienvenida
	li $v0, 4
	syscall
	
	jal start
	
	li $v0,10 			#termina
         syscall