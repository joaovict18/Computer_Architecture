.data

	f: .word 0
	g: .word 10
	h: .word 5
	i: .word 0
	j: .word 0
	
	array_A: .word 10, 20, 30, 40, 50, 60
	array_B: .word 1, 2, 3, 4, 5, 6

.text
.globl main
main:

	# Loads the variables
	lw $s0, f
	lw $s1, g
	lw $s2, h
	lw $s3, i
	lw $s4, j
	
	# Loads the arrays's bases
	la $s6, array_A
	la $s7, array_B
	
	# f = g + h + B[4]
	lw $t0, 16($s7)
	add $t1, $s1, $s2
	add $t1, $t1, $t0
	
	# f = g - A[B[4]]
	lw $t0, 16($s7)
	sll $t0, $t0, 2
	add $t1, $s6, $t0
	lw $t2, 0($t1)
	sub $s0, $s1, $t2
	sw $s0, f

	# Ends the program
	li $v0, 10
    	syscall
    	
# In the first case, 5 registers
# In the second case, 6 registers