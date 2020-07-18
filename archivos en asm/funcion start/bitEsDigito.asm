.text
.globl bitEsDigito

#bitEsDigito
#Verifica si un bit es un numero o no.
#Parametros: 	registro $a0 -- el bit a validar
#Retorna: 	registro $v0 -- 1 si el bit es un numero, si no 0
bitEsDigito:

	#Reservar memoria

    	addi $sp, $sp, -8
    	sw $t0, 0($sp)
    	sw $ra, 4($sp)

	li  $t0, '0'			#carga como bit
	bltu   $a0 ,$t0, noEs        # si bit < '0' no es un digito


	li $t0, '9'
	bltu   $t0 ,$a0, noEs       # si bit > '9' no es digito

	li $v0, 1			#retorno
	j fin

    noEs:
	li $v0, 0			#retorno

    fin:
   
    	#liberar la memoria
    	lw $t0, 0($sp)
    	lw $ra, 4($sp)
    	addi $sp, $sp, 8
    	
    	jr $ra
