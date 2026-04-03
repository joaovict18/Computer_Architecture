.data

	# Reserves space for 4 variables
	n1: .word 0
	n2: .word 0
	n3: .word 0
	n4: .word 0

	# Interface messages
	input_msg: .asciiz "Input a number: "
	sucess_msg1: .asciiz "The value "
	sucess_msg2: .asciiz " reached the 3 expected values\n"
	sucess_msg3: .asciiz " reached the 4 expected values\n"
	error_msg1: .asciiz "Better luck next time. The value  "
	error_msg2: .asciiz " is below than the expected\n"

.text
.globl main

main:
	# Asks the for first number
	li $v0, 4
	la $a0, input_msg
	syscall
	li $v0, 5
	syscall
	sw $v0, n1
	
	# Asks the for second number
	li $v0, 4
	la $a0, input_msg
	syscall
	li $v0, 5
	syscall
	sw $v0, n2
	
	# Asks the for third number
	li $v0, 4
	la $a0, input_msg
	syscall
	li $v0, 5
	syscall
	sw $v0, n3
	
	# Loads the values from the memory to registers
	lw $t0, n1
	lw $t1, n2
	lw $t2, n3
	
	# Sums
	add $s0, $t0, $t1
	add $s0, $s0, $t2

	# Compares
	li $t4, 21
	bge $s0, $t4, reached_21
	
	# Continues the program if the condition over is not True. Asks for a fourth value
	li $v0, 4
	la $a0, input_msg
	syscall
	li $v0, 5
	syscall
	sw $v0, n4
	
	lw $t3, n4
	add $s0, $s0, $t3
	
	li $t4, 24
	bge $s0, $t4, reached_24
	
	j fail
	
# Situation that the value is greater than 21
reached_21:
	
	li $v0, 4
	la $a0, sucess_msg1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, sucess_msg2
	syscall
	
	j end

# Situation that the value is greater than 24	
reached_24:
	li $v0, 4
	la $a0, sucess_msg1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, sucess_msg3
	syscall
	
	j end
	
# Fails the situations over
fail:
	li $v0, 4
	la $a0, error_msg1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, error_msg2
	syscall
	
	j end
	
end:
	li $v0, 10
	syscall