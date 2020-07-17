.text
.globl strIsDigit

#recibe $a0 -> cadena de  texto
#retorna $v0, 1 si es digito, 0 si no lo es.
strIsDigit:

	#Reservar memoria

    	addi $sp, $sp, -20
    	sw $t0, 0($sp)
    	sw $t1, 4($sp)
    	sw $t2, 8($sp)
    	sw $t3, 12($sp)
    	sw $ra, 16($sp)

    	la $t0, ($a0)			#muevo cadena de texto a t0

    	li $t3, 0			#contador inicia en 0

    	li $t2, 1			#bandera t2 para and y retorno
    					#retorna  1 si es numero, si no -> cambia a 0

    do:

    	add $t1, $t3, $t0

    	lb $t1, 0($t1)			# obtener el primer digito de la cadena
				    	# comparar si es salto o enter y verifica si es 0 el contador
    	beq $t1, 13 , comparefirst  	#\d
  	beq $t1, 10 , comparefirst 	#\n

    while:
    					#compara si termina el texro
  	beq $t1, 10 , endStrIsDigit 	#\n
  	
	move $a0, $t1
    	jal bitIsDigit
    	
    	and $t2, $t2, $v0		#comparar v0 con 0, y sale

    	addi $t3, $t3, 1		#aumenta el contador

    	j do

comparefirst:				#verifica si es la primera posicion
    	bne $t3, 0, endStrIsDigit
    	andi $t2, $t2, 0

    endStrIsDigit:
    	move $v0, $t2

    	#Reservar memoria

    	lw $t0, 0($sp)
    	lw $t1, 4($sp)
    	lw $t2, 8($sp)
    	lw $t3, 12($sp)
    	lw $ra, 16($sp)
    	addi $sp, $sp, 20
    	jr $ra
