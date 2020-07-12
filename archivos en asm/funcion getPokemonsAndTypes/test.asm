	.data
fout:   .asciiz "\\A:\\Asus\\Documents\\Orgy\\Project\\Org-Combate-Pokemon\\archivos en asm\\funcion getPokemonsAndTypes\\pokeTypes.txt"      # filename for output
	.text
.globl 	main

main:
  	la $a0, fout
  	jal read
  	
  	la $a0, ($v0)
  	
  	jal getPokemonsAndTypes
  	
  	la $s1, ($v0)
  	la $s2, ($v1)
  	
  	
  	add     $t0,$0,$0     # counter
  	add	$t1, $0, $0	
  	addi 	$t2, $0, 107
  	while:
    	bgt     $t1,$t2,done        # more strings to output?  if no, fly
    	add	$t3, $t0, $s1	
   	lw      $t4, 0($t3)      # get pokemon
   	
    	# output the string
    	li      $v0,4
    	move    $a0, $t4
    	syscall
    	jal     printLn
    	
    	add	$t3, $t0, $s2	
   	lw      $t4, 0($t3)      # get type
   	
    	# output the string
    	li      $v0,4
    	move    $a0, $t4
    	syscall
    	jal     printLn


    	addi    $t0,$t0,4           # advance array index
    	addi    $t1,$t1,1           # advance count
    	j       while
  	


  	
 done:
  	li $v0, 10
  	syscall
