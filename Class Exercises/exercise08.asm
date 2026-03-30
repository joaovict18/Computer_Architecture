.data

	# Initialize variables
	A: .word 0
	B: .word 0
	C: .word 0
	D: .word 0
	E: .word 0

.text
.globl main

main:
	# a = b + c - (d - e)
	
	# Takes the value of D
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Takes the value of E
	li $v0, 5
	syscall
	move $t1, $v0

	# Value of (d - e)
	sub $t2, $t0, $t1
	
	# Takes the value of B
	li $v0, 5
	syscall
	move $t0, $v0

	# Takes the value of C
	li $v0, 5
	syscall
	move $t1, $v0

	# Does b + c
	add $t3, $t0, $t1

	# Full expression and saves A
	sub $t0, $t3, $t2
	sw $t0, A

	# Prints the result
	li $v0, 1
	move $a0, $t0
	syscall
	
	# Ends the program
	li $v0, 10
	syscall