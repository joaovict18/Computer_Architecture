.data

	# Initialize 3 variables
	A: .word 0
	B: .word 0
	C: .word 0
	D: .word 0

.text
.globl main

main:
	# a = (b + c) - (c + d)
	
	# Takes the value of B
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Takes the value of C
	li $v0, 5
	syscall
	move $t1, $v0
	
	# (b + c)
	add $t3, $t0, $t1
	
	# Takes the value of D
	li $v0, 5
	syscall
	move $t2, $v0
	
	# (c + d)
	add $t4, $t1, $t2
	
	# Full expression
	sub $t5, $t3, $t4
	
	sw $t5, A
	
	# Prints the result
	li $v0, 1
	move $a0, $t5
	syscall
	
	# Ends the program
	li $v0, 10
	syscall