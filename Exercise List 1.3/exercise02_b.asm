.data
    val_a: .word 5        # First input value (a)
    val_b: .word -2       # Second input value (b)
    msg:   .asciiz "Sum Result: " # String to be printed

.text
.globl main

main:
    la $t0, val_a
    lw $a0, 0($t0)        # $a0 = a (5)
    
    la $t0, val_b
    lw $a1, 0($t0)        # $a1 = b (-2)
    
    # Call the function
    jal positive          
    
    # Save the result
    move $s1, $v0 # Copy result from $v0 to $s1 to preserve it

    # rint the result message 
    la $a0, msg          
    li $v0, 4             
    syscall               

    # Print the integer value 
    move $a0, $s1         
    li $v0, 1             
    syscall               

    # End the program
    li $v0, 10            
    syscall               


# Positive function: Acts as a bridge to call addit
positive:
    # Prologue: Protect the stack ---
    addi $sp, $sp, -4     # Adjust stack pointer to create space for 1 item
    sw   $ra, 0($sp)      # Save Return Address ($ra) onto the stack
    
    # Call sub-function
    jal  addit            # $v0 will now contain the raw sum (a + b)
    
    # Epilogue: Restore from stack ---
    lw   $ra, 0($sp)      # Restore the original Return Address
    addi $sp, $sp, 4      # Deallocate stack 
    
    jr   $ra

# Addit function
addit:
    add  $v0, $a0, $a1   
    jr   $ra              