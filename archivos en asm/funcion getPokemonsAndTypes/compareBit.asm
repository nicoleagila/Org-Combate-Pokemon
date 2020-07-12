.text

.globl compareBit

#Parametros: $a0 -> bit1	$a1 -> bit2
#retorna 0 si los dos bits son iguales
compareBit:

	addi $sp, $sp, -16
        sw $t0, 0($sp)
        sw $a0, 4($sp)
        sw $a1, 8($sp)
        sw $ra, 12($sp)
        
resta:
        sub $t0, $a0, $a1		#resta ambos caracteres
        move $v0, $t0
        
        
        lw $t0, 0($sp)
        lw $a0, 4($sp)
        lw $a1, 8($sp)
        lw $ra, 12($sp)
        addi $sp, $sp, 16
        
        jr $ra
