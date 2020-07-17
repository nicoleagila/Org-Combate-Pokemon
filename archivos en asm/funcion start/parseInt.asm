	.text
.globl	parseInt
# $a0 -> str a convertir
parseInt:
	# Reservacion de memoria
	addi $sp, $sp, -32  #(6*4)
    	sw $t0, 0($sp)
    	sw $t1, 4($sp)
    	sw $t2, 8($sp)
    	sw $s0, 12($sp)
    	sw $s1, 16($sp)
    	sw $a0, 20($sp)
    	sw $a1, 24($sp)
    	sw $ra, 28($sp)
    
    	jal len
    	move $s0, $v0		# Guardo el len en $s0 y le resto 1
    	addi $s0, $s0, -1	
    	move $s1, $a0		# Muevo a0 a s1,  para dejar libre a0 y usarlo para argumentos
    	
    	addi $t0, $0, 0		# iterador i
    	addi $t1, $0, 0		# Acumulador
    	for:
	sle $t2, $t0, $s0	# i < len
	bne $t2, 1, final
	
	add $t2, $s1, $t0	# Offset
	lb $t2, ($t2)		
	addi $t2, $t2, -48  	#Convierte de ASCII a digit
	#1523
	
	move $a0, $t2		#muevo a a0 el numeroo en int
	sub $a1, $s0, $t0	#muevo a a1 el la resta del len - i  para oobtener el factor n
	jal numberEn
	#1000
	add $t1, $t1, $v0
	addi $t0, $t0, 1
	j for
	
	final:
	move $v0, $t1		#retorno el acumulador
    		
	# Liberacion de memoria
	lw $t0, 0($sp)
    	lw $t1, 4($sp)
    	lw $t2, 8($sp)
    	lw $s0, 12($sp)
    	lw $s1, 16($sp)
    	lw $a0, 20($sp)
    	lw $a1, 24($sp)
    	lw $ra, 28($sp)
    	addi $sp, $sp, 32
    	
    	jr $ra