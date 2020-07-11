.data

.text

.globl lenArray

#parametros: arreglo -> $a0
#retorna la longitud del arreglo en $v0
lenArray:
        addi $sp,$sp,-16
        sw  $ra,0($sp)
        sw  $a0,4($sp)
        sw $t1, 8($sp)
        sw $t2, 12($sp)
        
        
        
        li  $t1,0
bucle:
        lw  $t2,0($a0)
        beq $t2,$zero,retorno
        addi $t1,$t1,1
        addi $a0,$a0,4
        j   bucle

retorno:    
        move $v0,$t1
        
        lw  $ra,0($sp)
        lw  $a0,4($sp)
        lw $t1, 8($sp)
        lw $t2, 12($sp)
        addi  $sp,$sp,16
        jr  $ra
