.data
.eqv DIMENSION 18
.eqv TAMANO_DATA 4

.text

.globl getFactor


#getFactor
#Obtiene el factor del ataque de la matriz de factores
#Parametros: 	registro $a0 -- tipo de ataque del pokemon
#		registro $a1 -- tipo de defensa del pokemon al que atacara
#		registro $a2 -- base del arreglo arreglo de tipos
#		registro $a3 -- base de la matriz de factores de ataque
#Retorna: 	registro $f0 -- el factor de ataque del pokemon
getFactor:
		addi $sp, $sp, -48
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $t0, 20($sp)
		sw $t1, 24($sp)
		sw $t2, 28($sp)
		sw $t3, 32($sp)
		sw $t4, 36($sp)
		sw $t5, 40($sp)
		sw $ra, 44($sp)

		la $s0, ($a0)			#$s0 -> tipo de ataque del pokemon
		la $s1, ($a1)			#$s1 -> tipo de defensa del pokemon
		
						#carga los indices como -1
		li $s2, -1			# $s2 -> i (defensa)
		li $s3, -1			# $s3 -> j (ataque)
	
		li $t0, 0			# $t0 -> k=0
			
		li $s4, DIMENSION		# $s4 -> dimension del arreglo
		
		# k<len y (j<0 o i<0)
condicion:	
		slt $t1, $t0, $s4
		slt $t2, $s3, $zero
		slt $t3, $s2, $zero
		
		or $t4, $t2, $t3
		and $t4, $t1, $t4

		bne $t4, $zero, cuerpo
		j retorno

cuerpo:

comparaAtaque:	sll $t4, $t0, 2
		add $t4, $t4, $a2
		lw $t4, 0($t4)			# $t4 -> tipo actual
		
		la $a0, ($t4)
		la $a1, ($s0)			#compara el tipo de ataque con el tipo actual
		jal comparaStr 
		
		bne $v0, $zero, comparaDefensa
		
guardarAtaque:
		move $s3, $t0				
		
comparaDefensa:
		la $a0, ($t4)
		la $a1, ($s1)			#compara el tipo de defensa con el tipo actual
		jal comparaStr 
		
		bne $v0, $zero, incremento
		
guardarDefensa:
		move $s2, $t0		
		
incremento:
		addi $t0, $t0, 1
		j condicion


retorno:
				
		#indexar a matrix
		mul $t5, $s3, $s4		# $t5 = i * tamanoCol
		add $t5, $t5, $s2		#	 + j
		mul $t5, $t5, TAMANO_DATA	# * TAMANO_DATA
		
		add $t5, $t5, $a3		#direccionBase
		l.s $f0, ($t5)
		
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $t0, 20($sp)
		lw $t1, 24($sp)
		lw $t2, 28($sp)
		lw $t3, 32($sp)
		lw $t4, 36($sp)
		lw $t5, 40($sp)
		lw $ra, 44($sp)
		addi $sp, $sp, 48
		
		jr $ra
		
