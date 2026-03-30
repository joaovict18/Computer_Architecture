.data

	# Initialize variables
	A: .word 0
	C: .word 0
	Eq_Msg: .asciiz "Os valores sao iguais\n"
	Diff_Msg: .asciiz "Os valores sao diferentes\n" 

.text
.globl main

main:
	# a = b << 2 
	
	# Takes the value of B
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Deslocate 2 bits to left equals to multiplicate by 4
	sll $t1, $t0, 2
	sw $t1, A

	# c = b + b + b + b
	add $t2, $t0, $t0
	add $t2, $t2, $t0
	add $t2, $t2, $t0
	sw $t2, C
	
	# Compares
	beq $t1, $t2, eq_values
	li $v0, 4
	la $a0, Diff_Msg
	syscall
	j end
	
# Switch
eq_values:
	li $v0, 4
	la $a0, Eq_Msg
	syscall	

# End Section
end:
	li $v0, 10
	syscall
