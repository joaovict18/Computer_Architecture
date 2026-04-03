# Initializes data section in adress 0x10000000
.data 0x10000000

	# Initialize vector with the values
	vector: .word 10, 11, 12, 13, 14
	
.text
.globl main
main:
	# Loads the vector in a intiial register
	la $t0, vector
	# Loads each element in vector in a different register
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	lw $t3, 8($t0)
	lw $t4, 12($t0)
	lw $t5, 16($t0)