.text

.globl comparaBit

#comparaBit
#Compara dos bits
#Parametros: 	registro $a0 -- bit 1 a comparar
#		registro $a1 -- bit 2 a comparar
#Retorna: 	registro $v0 -- la resta entre al ascii de los dos bits, 0 si son iguales
comparaBit:

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
