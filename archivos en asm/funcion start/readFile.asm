        .data
.eqv	SIZE	2048
buffer: .space SIZE

        .text
.globl 	read
read:
  	#Reservacion de memoria
  	addi $sp, $sp, -20 
    	sw $t0, 0($sp)
    	sw $a1, 4($sp)
    	sw $a2, 8($sp)
    	sw $a0, 12($sp)
    	sw $ra, 16($sp)
    	
  	# Open (for reading) a file
  	li $v0, 13       # system call for open file
  	li $a1, 0        # flags
  	syscall          # open a file (file descriptor returned in $v0)

  	move $t0, $v0    # save file descriptor in $t0		
  
  	# Read to file just opened  
  	li $v0, 14       # system call for read to file
  	la $a1, buffer   # address of buffer from which to write
  	li $a2, SIZE    # hardcoded buffer length
  	move $a0, $t0    # put the file descriptor in $a0		
  	syscall          # write to file

  	# Get the value from certain address


  	# Close the file 
  	li $v0, 16       # system call for close file
  	move $a0, $t0    # Restore fd
  	syscall          # close file

  	la $v0, buffer #load the address into $a0
  
  	#Liberacion de memoria
    	lw $t0, 0($sp)
    	lw $a1, 4($sp)
    	lw $a2, 8($sp)
    	lw $a0, 12($sp)
    	lw $ra, 16($sp)
    	addi $sp, $sp, 20 
  	jr $ra

