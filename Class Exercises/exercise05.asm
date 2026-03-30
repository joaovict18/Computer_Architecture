.data

	# Initialize 3 variables, with an initial value associate to B and C
	A: .word 0
	B: .word 19
	C: .word 22

.text
.globl main

main:
	# a = (b - 3) + c
	
	# (b - 3)
	lw $t2, B
	addi $t0, $t2, -3
	
	# (b - c) + c
	lw $t3, C
	add $t1, $t0, $t3
	
	# Saves the result
	sw $t1, A
	
	# Ends the program
	li $v0, 10
	syscall