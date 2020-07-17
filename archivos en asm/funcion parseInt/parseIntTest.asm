	.data
buffer: .space 20
str1:	.asciiz "Ingrese un numero del 1 al 11"

	.text
.globl 	main

main:
  	li $v0,8 #take in input
        la $a0, buffer #load byte space into address
        li $a1, 10 # allot the byte space for string
        move $t0,$a0 #save string to t0
        syscall
       
  	jal parseInt
  	
  	la $a0, ($v0)
  	li $v0, 1
  	syscall
  	
  	#Fin de funcion
  	li $v0, 10
  	syscall
