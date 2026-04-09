.data
    i: .word 1 
    j: .word 1 
    f: .word 0 
    g: .word 4 
    h: .word 4 
    test: .word 50
    msg_result: .asciiz "The value of F is: "
    msg_test: .asciiz "\nThe value of test variable is: "

.text
.globl main

main:
    # --- Loads memory's variables ---
    la $t0, test
    lw $s0, 0($t0)    # $s0 holds 'test' (50) - Preserved register
    
    la $t0, g
    lw $a0, 0($t0)    # $a0 = g
    la $t0, h
    lw $a1, 0($t0)    # $a1 = h
    la $t0, i
    lw $a2, 0($t0)    # $a2 = i
    la $t0, j
    lw $a3, 0($t0)    # $a3 = j

    # --- Calls the function ---
    jal sheet_example

    # Copy result from $v0 for $s1 to not lose in syscalls
    move $s1, $v0 

    # --- Prints results ---
    la $a0, msg_result 
    li $v0, 4 
    syscall 

    # Prints value of F (in $s1)
    move $a0, $s1
    li $v0, 1 
    syscall 

    # --- Prints the test variable ---
    la $a0, msg_test 
    li $v0, 4 
    syscall 

    # Prints the value of 'test' ($s0 may stay as 50)
    move $a0, $s0 
    li $v0, 1 
    syscall 

    # Ends the program
    li $v0, 10 
    syscall 

# ----------------------------------------------------------
# Sheet function: Calculate f = (g+h) - (i+j)
# ----------------------------------------------------------
sheet_example:
    # 1. Prologue: Protect the stack
    addi $sp, $sp, -12 
    sw $t1, 8($sp) 
    sw $t0, 4($sp) 
    sw $s0, 0($sp)     # Save the original $s0 (it was 50 in main)

    # 2. Function body
    add $t0, $a0, $a1  # $t0 = g + h
    add $t1, $a2, $a3  # $t1 = i + j
    sub $s0, $t0, $t1  # $s0 = (g+h) - (i+j)

    # 3. Prepares return
    move $v0, $s0

    # 4. Epilogue: Restoring registers in stack
    lw $s0, 0($sp)     # $s0 backs to 50!
    lw $t0, 4($sp) 
    lw $t1, 8($sp) 
    addi $sp, $sp, 12

    # 5. Return
    jr $ra
    
# BEFORE jal sheet_example
# Value in $t0: 0
# Value in $t1: 0
# Value in $s0: 0
# Value in $sp: 0
# Value in $ra: 0
# Value in $pc: 4194304 

# AFTER jal sheet_example
# Value in $t0: 268500996
# Value in $t1: 0
# Value in $s0: 50
# Value in $sp: 2147479548
# Value in $ra: 0
# Value in $pc: 4194364

 # AFTER function
 # Value in $ra: 4194368
 # Value in $pc: 4194436
 
 # As the stack grows down, the values gonna be store as the pattern: sw $t1, 8($sp) -> sw $t0, 4($sp) 
 # The $sp register works as a base to stack, when the function needs space to store temporary values
 # It substract the length necessary from $sp
 
 # $ra: 4194368
 # $sp: 4194368