	.data
.eqv	SIZE	15
	.text
.globl 	heapReservation
#Reserva un espacio de memoria heap dentamanio SIZE
heapReservation:
	# Reservacion de sp
	addi $sp, $sp, -8
    	sw $a0, 0($sp)
    	sw $ra, 4($sp)
    	
	li $a0 SIZE #enough space for two integers
    	li $v0 9 #syscall 9 (sbrk)
    	syscall
    	
    	# Liberacion de sp
    	lw $a0, 0($sp)
    	lw $ra, 4($sp)
    	addi $sp, $sp, 8
    	
    	#retorno
    	jr $ra