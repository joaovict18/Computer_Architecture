.data

	X: .word 0
	Y: .word 0

.text
.globl main

main:
	# Takes the value from keyboard
	li $v0, 5
	syscall
	
	# Associates the value from keyboard to $t0 (later X)
	move $t0, $v0
	sw $t0, X
	
	# Increments the  value of X by 1 and stores it in register t1
	addi $t1, $t0, 1

	# Saves the result on Y
	sw $t1, Y
	
	# Ends the program
	li $v0, 10
	syscall
