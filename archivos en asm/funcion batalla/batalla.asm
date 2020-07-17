.data

t1: 		.asciiz normal
t2: 		.asciiz fight
t3: 		.asciiz flying
t4: 		.asciiz poison
t5: 		.asciiz ground
t6: 		.asciiz rock
t7: 		.asciiz bug
t8: 		.asciiz ghost
t9:		.asciiz steel
t10:		.asciiz fire
t11: 		.asciiz water
t12: 		.asciiz grass
t13: 		.asciiz electric
t14: 		.asciiz psychic
t15: 		.asciiz ice
t16: 		.asciiz dragon
t17: 		.asciiz dark
t18: 		.asciiz fairy

types:		.word t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14. t15, t16, t17, t18

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
		
ataque:		.float 2.0, 2.0

vida:		.float 5.0, 5.0 

		.align 2
nombres: 	.space 8

msjCombatienes:	.asciiz "Combatientes: "
msjVs:		.asciiz " vs "

.text
.globl batalla

#recibe:
#	$a0 -> nombre del pok1, 	$a2 -> tipo pok1
#	$a1 -> nombre pok2, 		$a3 -> tipo pok2
batalla:
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
		
	la $s4, types			#    tipos = getTypeArray('types.txt')
	la $s5, mFactor			#    matriz = obtenerMatrizVentajas('matriz.txt')

#    print("Combatientes: {0} vs {1}".format(nombre1, nombre2))
	la $a0, msjCombatienes
	li $v0, 4
	syscall
	
	la $a0, $s0
	li $v0, 4
	syscall	
	
	la $a0, msjVs
	li $v0, 4
	syscall	
	
	la $a0, $s1
	li $v0, 4
	syscall
	
#    nombres = [nombre1, nombre2]	
	li $t0, 0
	sw $a0, nombres($t0)
	li $t0, 4
	sw $a1, nombres($t0)
	
#    ataques = np.array([2*getFactor(tipo1, tipo2, tipos, matriz),2*getFactor(tipo2, tipo1, tipos, matriz)])

	la $a0, $s2
	la $a1, $s3
	la $a2, types
	la $a3, mFactor
	jal getFactor
	
	sw $v0,






    while (vida[0] > 0) and (vida[1] > 0):
        ataque([0, 1], nombres, vida, ataques)
        if(vida[1] > 0):
            ataque([1, 0], nombres, vida, ataques)

    ganador = vida.argmax()
    print("{0} es el Ganador!".format(nombres[ganador]))