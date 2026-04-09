.data
	n_val: .word 5 # fib(5)
	msg: .asciiz "Fibonacci result: "
	
.text
.globl main

main:

	la $t0, n_val
	lw $a0, 0($t0) # Loads n = 5 in $a0
	
	jal fib
	
	move $s0, $v0 # Salves result in $s0
	la $a0, msg
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
# Recursive function
fib:
	addi $sp, $sp, -12 # Reserves space for $ra
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	
	move $s0, $a0 # $s0 = n
	
	# Base case 1 if (n == 0)
	li $v0, 0
	beq $s0, $zero, fib_exit
	
	# Base case 1 if (n == 1)
	li $v0, 1
	beq $s0, 1, fib_exit
	
	# Recursive case fib(n - 1) + fib(n - 2)
	addi $a0, $s0, -1 # Prepares argument (n - 1)
	jal fib # Recursion
	sw $v0, 0($sp)
	
	addi $a0, $s0, -2 # Prepares argument (n - 2)
	jal fib # Recursion
	
	
	lw $t0, 0($sp)
	add $v0, $t0, $v0

fib_exit:
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	jr $ra # Return who called