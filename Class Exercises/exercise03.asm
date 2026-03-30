.data

	# Iniatilize two variables
	X: .word 19
	Y: .word 22

.text
	# Loads the two variables to registers
	lw $t0, X
	lw $t1, Y
	
	# Increments the  value of X by 1 and stores it in register t1
	addi $t1, $t0, 1

	# Saves the result on Y
	sw $t1, Y
