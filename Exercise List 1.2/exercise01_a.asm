.data

	f: .word 1
	g: .word 2
	h: .word 3
	i: .word 4

.text
main:
.globl main	
	
	# Loads from memory to registers
	lw $s0, f
	lw $t0, g
	lw $t1, h
	lw $t2, i
	
	# f = g - h
	sub $s0, $t0, $t1
	
	# f = g + (h - 5)
	add $t3, $t1, -5
	add $s0, $t0, $t3 
	
	# Ends the program
	li $v0, 10
    	syscall
	 
	