.data
		.align 2
ataques:	.space 8

vidas:		.float 5.0, 5.0 

		.align 2
nombres: 	.space 8

		.align 2
indices: 	.space 8

valor0:		.float 0.0
valor1:		.float 1.0
valor2:		.float 2.0
valor4:		.float 4.0

msjCombatienes:	.asciiz "\n\nCombatientes:\n"
msjVs:		.asciiz " vs "
msjGanador:	.asciiz " es el Ganador!"

mFactor:	.float 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 0.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0
		.float 2.0, 1.0, 0.5, 0.5, 1.0, 2.0, 0.5, 0.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 2.0, 0.5
		.float 1.0, 2.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0
		.float 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 0.5, 0.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0
		.float 1.0, 1.0, 0.0, 2.0, 1.0, 2.0, 0.5, 1.0, 2.0, 2.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0
		.float 1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 2.0, 1.0, 0.5, 2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0
		.float 1.0, 0.5, 0.5, 0.5, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 2.0, 0.5
		.float 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 1.0
		.float 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5, 0.5, 1.0, 0.5, 1.0, 2.0, 1.0, 1.0, 2.0
		.float 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 2.0, 1.0, 2.0, 0.5, 0.5, 2.0, 1.0, 1.0, 2.0, 0.5, 1.0, 1.0
		.float 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 1.0, 1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0
		.float 1.0, 1.0, 0.5, 0.5, 2.0, 2.0, 0.5, 1.0, 0.5, 0.5, 2.0, 0.5, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0
		.float 1.0, 1.0, 2.0, 1.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 0.5, 1.0, 1.0
		.float 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 0.0, 1.0
		.float 1.0, 1.0, 2.0, 1.0, 2.0, 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 2.0, 1.0, 1.0, 0.5, 2.0, 1.0, 1.0
		.float 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.0
		.float 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5
		.float 1.0, 2.0, 1.0, 0.5, 1.0, 1.0, 1.0, 1.0, 0.5, 0.5, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 1.0

t1: 		.asciiz "normal"
t2: 		.asciiz "fight"
t3: 		.asciiz "flying"
t4: 		.asciiz "poison"
t5: 		.asciiz "ground"
t6: 		.asciiz "rock"
t7: 		.asciiz "bug"
t8: 		.asciiz "ghost"
t9:		.asciiz "steel"
t10:		.asciiz "fire"
t11: 		.asciiz "water"
t12: 		.asciiz "grass"
t13: 		.asciiz "electric"
t14: 		.asciiz "psychic"
t15: 		.asciiz "ice"
t16: 		.asciiz "dragon"
t17: 		.asciiz "dark"
t18: 		.asciiz "fairy"
types:		.word t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18

.text

.globl batalla
#recibe:
#	$a0 -> nombre del pok1, 	$a2 -> tipo pok1
#	$a1 -> nombre pok2, 		$a3 -> tipo pok2
batalla:
	addi $sp, $sp, -48
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $t0, 16($sp)
	sw $t1, 20($sp)
	sw $t2, 24($sp)
	sw $t3, 28($sp)
	sw $t4, 32($sp)
	s.s $f1, 36($sp)
	s.s $f2, 40($sp)
	sw $ra, 44($sp)
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
		
#    print("Combatientes: {0} vs {1}".format(nombre1, nombre2))
	la $a0, msjCombatienes
	li $v0, 4
	syscall
	
	la $a0, ($s0)
	li $v0, 4
	syscall	
	
	la $a0, msjVs
	li $v0, 4
	syscall	
	
	la $a0, ($s1)
	li $v0, 4
	syscall
	
	jal printLn
	jal printLn
	
#    nombres = [nombre1, nombre2]	
	li $t0, 0
	sw $s0, nombres($t0)
	
	addi $t0, $t0, 4
	sw $s1, nombres($t0)
	
#    ataques = np.array([2*getFactor(tipo1, tipo2, tipos, matriz),2*getFactor(tipo2, tipo1, tipos, matriz)])
	la $a0, ($s2)
	la $a1, ($s3)
	la $a2, types
	la $a3, mFactor
	jal getFactor
	
	li $t0, 0
	l.s $f1, valor2
	mul.s $f0, $f0, $f1
	s.s $f0, ataques($t0)		# carga el factor de ataque del pok1
	
	la $a0, ($s3)
	la $a1, ($s2)
	la $a2, types
	la $a3, mFactor
	jal getFactor

	addi $t0, $t0, 4
	l.s $f1, valor2
	mul.s $f0, $f0, $f1
	s.s $f0, ataques($t0)		# carga el factor de ataque del pok2
	
while:	
	# while (vida[0] > 0) and (vida[1] > 0):
	li $t0, 0			#indice
	l.s $f1, valor0			#0 para comparar
											#ME QUEDE AQUI	
	l.s $f2, vidas($t0)		#vida del primer pok
	
	c.lt.s $f1, $f2
	bc1f ganador

	addi $t0, $t0, 4
	l.s $f2, vidas($t0)		#vida del segundo pok
	
	c.lt.s $f1, $f2
	bc1f ganador
	
	#ataque([0, 1], nombres, vida, ataques)
	li $t1, 0
	sw $t1, indices($t1)
	
	addi $t1, $t1, 1
	addi $t2, $zero, 4
	sw $t1, indices($t2)
	
	la $a0, indices
	la $a1, nombres
	la $a2, vidas
	la $a3, ataques
	
	jal ataque
	
	jal printLn
	
	# if(vida[1] > 0):	
	li $t0, 4
	l.s $f1, valor0	
	l.s $f2, vidas($t0)		#verifico del segundo pok
	
	c.lt.s $f1, $f2
	bc1f while
	
	# ataque([1, 0], nombres, vida, ataques)	
        li $t3, 0
        li $t4, 4
	sw $t3, indices($t4)
	
	addi $t3, $t3, 1
	addi $t4, $t4, -4
	sw $t3, indices($t4)
	
	la $a0, indices
	la $a1, nombres
	la $a2, vidas
	la $a3, ataques
	
	jal ataque
	jal printLn
	j while
	            
ganador:
	# ganador = vida.argmax()
	la $a0, vidas
	jal maxValue
	sll $t0, $v0, 2
	lw $t1, nombres($t0)
	
	# print("{0} es el Ganador!".format(nombres[ganador]))	
	la $a0, ($t1)
	li $v0, 4
	syscall
	
	la $a0, msjGanador
	li $v0, 4
	syscall	
	

	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $t0, 16($sp)
	lw $t1, 20($sp)
	lw $t2, 24($sp)
	lw $t3, 28($sp)
	lw $t4, 32($sp)
	l.s $f1, 36($sp)
	l.s $f2, 40($sp)
	lw $ra, 44($sp)
	addi $sp, $sp, 48
	
	jr $ra
