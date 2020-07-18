	.data
coma:	.ascii ","
r:	.ascii "\t"
nulo:	.ascii "\0"
buffer:	.space 6000
		.align 2
pokemones:	.space	440
		.align 2
tipos:		.space	440
	.text
.globl 	getPokemonesyTipos
	
# $a0-> se cambia a $s0, el buffer
#$t0 -> i 
# $s1 -> word en donde guardar las palabras
# Funcion que me retorna dos arreglos paralelos $v0->Arreglo con todos los pokemones y  $v1->Areglo con todos los tipos
getPokemonesyTipos:

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
			
		
		la $s6, pokemones
		la $s7, tipos
		
		move $s0, $a0
		add $t0, $0, $0
		add $t4, $0, $0
		add $t1, $0, $0
		
		la $s1, buffer
		
	whileNoComa:

		move $s5, $s1
		doComa:
		add $t2, $t0, $s0
		lb $a0, 0($t2)
		lb $a1, coma
		
		jal comparaBit
		
		whileComa:
		beq $v0, 0, guardarPok

		add $s2, $t4, $s5
		sb $a0, 0($s2)
		addi $t4,$t4, 1
		addi $t0, $t0, 1
		j doComa
		
	guardarPok:

		add $t3, $s6, $t1
			sw $s5, 0($t3)
			addi $t0, $t0, 1
			add $t4, $0, $0
			j whileNoR
			
	whileNoR:

		addi    $s1,$s1,15

		move $s5, $s1
		doR:
		add $t2, $t0, $s0
		lb $a0, 0($t2)
		lb $a1, nulo
		jal comparaBit
		
		whileR:
		beq $v0, 0, ultimo
		
		lb $a1, r
		jal comparaBit
		
		beq $v0, 0, guardar
		

		add $s2, $t4, $s5
		sb $a0, 0($s2)
		addi $t0, $t0, 1
		addi $t4,$t4, 1	
		j doR
		
	guardar:

		add $t3, $s7, $t1
		sw $s5, 0($t3)
		addi $t0, $t0, 2
		add $t4, $0, $0	
		addi $t1, $t1, 4
		addi    $s1,$s1,15
		j whileNoComa
	
	ultimo:

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
			
		jr $ra
		
