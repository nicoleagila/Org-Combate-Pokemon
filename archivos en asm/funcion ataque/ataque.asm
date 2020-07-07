    .data
result:     .asciiz "Resultado del ataque:\n"

    .text
    
.globl ataque

#Parametros:    indices-> $a0, nombre-> $a1, vida ->$a2, ataque -> $a3
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
	move $t2, $v0             #$t2 -> p1		indices[0]

        li $a1, 1
	la $a0, ($s0)
	jal index
	move $t3, $v0              #$t3 -> p2		indices[1]

        la $a1, ($t3)
        la $a0, ($a2)
        jal indexF
        mov.s $f1, $f0              #$f1 -> vida[p2]

        la $a1, ($t2)
        la $a0, ($a3)
        jal indexF
        mov.s $f2, $f0              #$f2 -> ataque[p1]

        sub.s $f1, $f1, $f2         #disminuye la vida del atacado 	vida[p2]=vida[p2]-ataque[p1]
        
        sll $t0, $t3, 2			
        add $t0, $a2, $t0
        s.s $f1, 0($t0)			#guarda el nuevo valor en el arreglo de vidas
	
	jal printLn
	
        la $a0, result
        jal printNewLine            #imprime mensaje del resultado.... :

        la $a0, ($t2)
        la $a1, ($s1)
        jal printResult

        la $a0, ($t3)
        la $a1, ($s1)
        jal printResult
        
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
