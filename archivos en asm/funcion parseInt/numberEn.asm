	.text
.globl numberEn
# $a0 -> numero
# $a1 -> exponente de E
numberEn:
	#Reservacion de memoria
	addi $sp, $sp, -32  #(6*4)
    	sw $t0, 0($sp)
    	sw $t1, 4($sp)
    	sw $t2, 8($sp)
    	sw $t6, 12($sp)
    	sw $t7, 16($sp)
    	sw $a0, 20($sp)
    	sw $a1, 24($sp)
    	sw $ra, 28($sp)
	
	addi $t7, $0, 10	#constnte 10
	
	add $t0, $0, $0		# Iterador i
	addi $t1, $0, 1		# Acumulador de E*E...
	
	for:
	slt $t6, $t0, $a1
	bne $t6, 1, end
	mul $t1, $t1, $t7
	addi $t0, $t0, 1
	j for
	
	end:
	mul $t1, $a0, $t1
	move $v0, $t1
	
	# Liberacion de memoria
	lw $t0, 0($sp)
    	lw $t1, 4($sp)
    	lw $t2, 8($sp)
    	lw $t6, 12($sp)
    	lw $t7, 16($sp)
    	lw $a0, 20($sp)
    	lw $a1, 24($sp)
    	lw $ra, 28($sp)
    	addi $sp, $sp, 32
    	
    	jr $ra