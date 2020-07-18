    .data
resultado:     .asciiz "Resultado del ataque:\n"

    .text
    
.globl ataque

#ataque
#Simula el ataque entre dos pokemones
#Parametros: 	registro $a0 -- base del arreglo de indices, donde el primer indice es del pokemon que ataca, y el segundo del que es atacado
#		registro $a1 -- base del arreglo de nombres
#		registro $a2 -- base del arreglo de vidas
#		registro $a3 -- base del arreglo de ataques
ataque:

	addi $sp, $sp, -32
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	s.s $f1, 16($sp)
	s.s $f2, 20($sp)
	sw $ra, 24($sp)
	sw $t0, 28($sp)
	
        la $s0, ($a0)
	la $s1, ($a1)
        jal printInicio

        li $a1, 0
	la $a0, ($s0)
	jal index
	move $t2, $v0

        li $a1, 1
	la $a0, ($s0)
	jal index
	move $t3, $v0

        la $a1, ($t3)
        la $a0, ($a2)
        jal indexF
        mov.s $f1, $f0

        la $a1, ($t2)
        la $a0, ($a3)
        jal indexF
        mov.s $f2, $f0

        sub.s $f1, $f1, $f2
        
        sll $t0, $t3, 2			
        add $t0, $a2, $t0
        s.s $f1, 0($t0)	
	
	jal printLn
	
        la $a0, resultado
        li $v0, 4
	syscall

        la $a0, ($t2)
        la $a1, ($s1)
        jal printResultado

        la $a0, ($t3)
        la $a1, ($s1)
        jal printResultado
        
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	l.s $f1, 16($sp)
	l.s $f2, 20($sp)
	lw $ra, 24($sp)
	lw $t0, 28($sp)
	addi $sp, $sp, 32
	
        jr $ra
