		.data

texto1: 		.asciiz ": Vida: "
texto2: 		.asciiz "Ataque: "
espacio: 		.asciiz " "
valor0:			.float 0.0

.text
.globl printResultado

#printResultado
#Imprime el resultado de la batalla
#Parametros: 	registro $a0 -- indice del pokemon que se va a imprimir la informacion
#		registro $a1 -- base del arreglo de nombres de pokemones
#		registro $a2 -- base del arreglo de vidas
#		registro $a3 -- base del arreglo de ataques
printResultado:

		addi $sp, $sp, -16
		sw $s1, 0($sp)
		sw $s0, 4($sp)
		sw $ra, 8($sp)
		sw $t4, 12($sp)

		la $s0, ($a0)
		la $s1, ($a1)

		la $a1, ($s0)
		la $a0, ($s1)
		jal index
		move $t4, $v0

		li $v0, 4
		la $a0, ($t4)
		syscall

		li $v0, 4
		la $a0, texto1
		syscall

		la $a1, ($s0)
		la $a0, ($a2)
		jal indexF
		
		l.s $f1, valor0
		c.lt.s $f0, $f1
		bc1f noEs
		mov.s $f12, $f1
		j continua
		
	noEs:
		mov.s $f12, $f0
		
	continua:
		li $v0, 2
		syscall

		li $v0, 4
		la $a0, espacio
		syscall

		li $v0, 4
		la $a0, texto2
		syscall

		la $a1, ($s0)
		la $a0, ($a3)
		jal indexF
		mov.s $f12, $f0

		li $v0, 2
		syscall

		jal printLn

		lw $s1, 0($sp)
		lw $s0, 4($sp)
		lw $ra, 8($sp)
		lw $t4, 12($sp)
		addi $sp, $sp, 16

		jr $ra
