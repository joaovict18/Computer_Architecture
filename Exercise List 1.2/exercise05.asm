.data
	
	var_x: .word 10 # Loop limit
	var_y: .word 0 # Acumulated result
	var_i: .word 0 # Cont


.text
.globl main

main:
	# Init
	lw $s1, var_x
	lw $s2, var_y
	add $s0, $zero, $zero

loop:
	# Set on Less Than $t0 = 1 se $s0 < $s1
	slt $t0, $s0, $s1
	
	beq $t0, $zero, end
	
	add $s2, $s2, $s0
	
	addi $s0, $s0, 1
	
	j loop
	
end:
	# Saves the result in memory
	sw $s2, var_y
	sw $s0, var_i
	
	# Ends the program
	li $v0, 10
	syscall