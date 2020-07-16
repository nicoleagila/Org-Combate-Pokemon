.data
buffer: .space 10
str1:	.asciiz "Ingrese un numero del 1 al 10"
                        .text
.globl __start
__start:

         la $a0,str1 #Load and print string asking for string
         li $v0,4
         syscall

         li $v0,8 #take in input
         la $a0, buffer #load byte space into address
         li $a1, 10 # allot the byte space for string
         move $t0,$a0 #save string to t0
         syscall

         la $a0, buffer #reload byte space to primary address
#         move $a0,$t0 # primary address = t0 address (load pointer)
         li $v0,4 # print string
         syscall

         li $v0,10 #end program
         syscall



             ###############################
             #Output:
             #Enter string(max 20 chars): qwerty 123
             #You wrote:
             #qwerty 123
             #Enter string(max 20 chars):   new world oreddeYou wrote:
             #  new world oredde //lol special character
             ###############################