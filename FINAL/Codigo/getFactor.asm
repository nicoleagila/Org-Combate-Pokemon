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

		la $s0, ($a0)
		la $s1, ($a1)
		
		li $s2, -1
		li $s3, -1
	
		li $t0, 0
			
		li $s4, DIMENSION
		
	condicion:	
		slt $t1, $t0, $s4
		slt $t2, $s3, $zero
		slt $t3, $s2, $zero
		
		or $t4, $t2, $t3
		and $t4, $t1, $t4

		bne $t4, $zero, cuerpo
		j retorno

	cuerpo:

	comparaAtaque:
		sll $t4, $t0, 2
		add $t4, $t4, $a2
		lw $t4, 0($t4)
		
		la $a0, ($t4)
		la $a1, ($s0)
		jal comparaStr 
		
		bne $v0, $zero, comparaDefensa
		
	guardarAtaque:
		move $s3, $t0				
		
	comparaDefensa:
		la $a0, ($t4)
		la $a1, ($s1)
		jal comparaStr 
		
		bne $v0, $zero, incremento
		
	guardarDefensa:
		move $s2, $t0		
		
	incremento:
		addi $t0, $t0, 1
		j condicion


	retorno:			
		
		mul $t5, $s3, $s4
		add $t5, $t5, $s2
		mul $t5, $t5, TAMANO_DATA
		
		add $t5, $t5, $a3
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
		
