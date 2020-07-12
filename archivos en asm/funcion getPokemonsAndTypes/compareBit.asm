.text

.globl compareBit

#Parametros: $a0 -> bit1	$a1 -> bit2
#retorna 0 si los dos bits son iguales
compareBit:

	addi $sp, $sp, -8
        sw $t0, 0($sp)
        sw $ra, 4($sp)
        
resta:
        sub $t0, $a0, $a1		#resta ambos caracteres
        move $v0, $t0
        
        lw $t0, 0($sp)
        lw $ra, 4($sp)
        addi $sp, $sp, 8
        
        jr $ra
