.text
.globl bitIsDigit

#recibe en $a0 el bit que voy a validar
#retorna en $v0 0 si no es digito, 1 si es digito
bitIsDigit:

	#Reservar memoria

    	addi $sp, $sp, -8
    	sw $t0, 0($sp)
    	sw $ra, 4($sp)

	li  $t0, '0'			#carga como bit
	bltu   $a0 ,$t0, notdig        # si bit < '0' no es un digito


	li $t0, '9'
	bltu   $t0 ,$a0, notdig       # si bit > '9' no es digito

	li $v0, 1			#retorno
	j endIsDigit

    notdig:
	li $v0, 0			#retorno

    endIsDigit:
   
    	#liberar la memoria
    	lw $t0, 0($sp)
    	lw $ra, 4($sp)
    	addi $sp, $sp, 8
    	
    	jr $ra
