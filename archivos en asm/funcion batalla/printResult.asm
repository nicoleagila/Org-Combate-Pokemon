		.data

str1: 		.asciiz ": Vida: "
str2: 		.asciiz "Ataque: "
tab: 		.asciiz " "

.text
.globl printResult
#Parametros:    i-> $a0, nombre -> $a1, vida ->$a2, ataque -> $a3
#No hay retorno, solo muestra por pantalla

printResult:

	addi $sp, $sp, -16
	sw $s1, 0($sp)
	sw $s0, 4($sp)
	sw $ra, 8($sp)
	sw $t4, 12($sp)

	la $s0, ($a0)			#i -> $s0
	la $s1, ($a1)			#nombre -> $s1

    	la $a1, ($s0)
	la $a0, ($s1)
    	jal index
    	move $t4, $v0			#$t4 -> nombre[i] atacante

    	li $v0, 4
    	la $a0, ($t4)
    	syscall				#imprime el nombre de atacante

    	li $v0, 4
    	la $a0, str1
    	syscall				#imprime el testo de str1

    	la $a1, ($s0)
    	la $a0, ($a2)
    	jal indexF
	mov.s $f12, $f0			#$f0 -> vida[i] del atacante

    	li $v0, 2
    	syscall				#imprime vida del atacante

    	li $v0, 4
    	la $a0, tab
    	syscall				#imprime una tabulacion
    
    	li $v0, 4
    	la $a0, str2
    	syscall				#imprime texto en str2

	la $a1, ($s0)
	la $a0, ($a3)
    	jal indexF
	mov.s $f12, $f0			#$f0 -> ataque[i] atacante
	
	li $v0, 2
	syscall				#imprime el ataque del atacante

	jal printLn
	
	lw $s1, 0($sp)
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	lw $t4, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra