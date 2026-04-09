.data
	A: .word 1
	B: .word 100
	C: .word 1000
	D: .word 30

.text
.globl main
	
main:
	lw $a0, A
	lw $a1, B
	lw $a2, C
	lw $a3, D

	add $a2, $a3, $a2
	
	slt $a2, $a2, $a0
	move $v0, $a1
	beqz $a2, L
	jr $ra
	
L:
	move $a0, $a1
	jal g
	
g:
	lw $ra, 500
	