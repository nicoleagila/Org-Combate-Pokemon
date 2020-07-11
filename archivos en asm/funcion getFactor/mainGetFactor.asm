.data
tipoAtaque: .asciiz "electric"
tipoDefensa: .asciiz "electric"


matriz: .float 0.5, 2.0 ,1.0 ,1.0
	.float 0.5, 0.5 ,0.5 ,0.5
	.float 1.0, 1.0 ,0.5 ,1.0
	.float 2.0, 2.0 ,2.0 ,0.5
	
tipo1:	.asciiz "fire"
tipo2:	.asciiz "leaf"
tipo3:	.asciiz "poison"
tipo4:	.asciiz "electric"

tipos: .word tipo1, tipo2, tipo3, tipo4

.text

.globl main


main:
	la $a0, tipoAtaque
	la $a1, tipoDefensa
	la $a2, tipos
	la $a3, matriz

	jal getFactor
	
	li $v0, 10
	syscall