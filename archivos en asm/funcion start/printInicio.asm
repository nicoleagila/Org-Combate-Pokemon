
		.data

texto1: 		.asciiz ": Vida: "
texto2: 		.asciiz "Ataque: "
texto3: 		.asciiz "Ataca a "
espacio: 		.asciiz " "

        .text
.globl printInicio

#printInicio
#Imprime el inicio del ataque
#Parametros: 	registro $a0 -- base del arreglo de indices
#		registro $a1 -- base del arreglo de nombres de los pokemones
#		registro $a2 -- base del arreglo de vidas
#		registro $a3 -- base del arreglo de ataques
printInicio:

	addi $sp, $sp, -24
	sw $s1, 0($sp)
	sw $s0, 4($sp)
	sw $ra, 8($sp)
	sw $t1, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)

	la $s0, ($a0)			#indices-> $s0, nombre -> $s1
	la $s1, ($a1)

	li $a1, 0
	jal index
	move $t2, $v0			#i=indices[0] -> $t2 indice del atacante.
	
    la $a1, ($t2)
    la $a0, ($s1)
    jal index
    move $t4, $v0			#$t4 -> nombre[i] atacante

    li $v0, 4
    la $a0, ($t4)
    syscall				#imprime el nombre de atacante

    li $v0, 4
    la $a0, texto1
    syscall				#imprime el testo de str1

    la $a1, ($t2)
    la $a0, ($a2)
    jal indexF
	mov.s $f12, $f0			#$t4 -> vida[i] del atacante

    li $v0, 2
    syscall				#imprime vida del atacante

    li $v0, 4
    la $a0, espacio
    syscall				#imprime una tabulacion
    
    li $v0, 4
    la $a0, texto2
    syscall				#imprime texto2

	la $a1, ($t2)
	la $a0, ($a3)
    jal indexF
	mov.s $f12, $f0			#$t4 -> ataque[i] atacante
	
	li $v0, 2
	syscall				#imprime el ataque del atacante

    li $v0, 4
    la $a0, espacio
    syscall				#imprime un espacio

	li $v0, 4
	la $a0, texto3
	syscall				#imprime texto3
	
	li $a1, 1
	la $a0, ($s0)
	jal index
	move $t3, $v0			#j=indices[1] -> $t3 indice del atacado 
	
	la $a1, ($t3)		
    la $a0, ($s1)
    jal index
    move $t4, $v0			#$t4 -> nombre[i] atacado

    li $v0, 4
    la $a0, ($t4)
    syscall				#imprime el nombre de atacado

    li $v0, 4
    la $a0, texto1
    syscall				#imprime el texto1

	
    
    la $a1, ($t3)
    la $a0, ($a2)
    jal indexF
	mov.s $f12, $f0			#$t4 -> vida[i] del atacado

    li $v0, 4
    la $a0, espacio
    syscall				#imprime un espacio

    li $v0, 2
    syscall				#imprime vida del atacado
    
        
    li $v0, 4
    la $a0, espacio
    syscall				#imprime un espacio

    li $v0, 4
    la $a0, texto2
    syscall				#imprime texto2


	la $a1, ($t3)
	la $a0, ($a3)
    	jal indexF
	mov.s $f12, $f0			#$t4 -> ataque[i] atacado
	
	li $v0, 2
	syscall				#imprime el ataque del atacado
	
	lw $s1, 0($sp)
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	lw $t1, 12($sp)
	lw $t3, 16($sp)
	lw $t4, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra
