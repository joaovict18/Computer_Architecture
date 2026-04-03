.data

	# Space to stores name (50 caracteres)
	name: .space 50

	# Prompt messages	
	prompt_name: .asciiz "Enter your name: "
	prompt_year: .asciiz "Enter your birth year (YYYY): "

	# Output messages
	prefix_msg: .asciiz "\nName: "
	mid_msg: .asciiz "Result:  "
	
	# # Ratings
	cat_kid: .asciiz "Kid\n"
	cat_young: .asciiz "Young\n"
	cat_adult: .asciiz "Adult\n"
	cat_old: .asciiz "Old\n"

.text
.globl main
main:
	# Asks for name
	li $v0, 4
	la $a0, prompt_name
	syscall
	
	li $v0, 8
	la $a0, name
	li $a1, 50
	syscall
	
	# Asks for birth year
	li $v0, 4
	la $a0, prompt_year
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Calculates years old
	li $t1, 2026
	sub $s0, $t1, $t0
	
	# Prints the beggining of message
	li $v0, 4
	la $a0, prefix_msg
	syscall
	
	li $v0, 4
	la $a0, name
	syscall
	
	li $v0, 4
	la $a0, mid_msg
	syscall
	
	# Rating logic
	li $t1, 10
	ble $s0, $t1, is_kid
	
	li $t1, 19
	ble $s0, $t1, is_young
	
	li $t1, 59
	ble $s0, $t1, is_adult
	
	j is_old
	
# Print blocks by rating

is_kid:
	li $v0, 4
	la $a0, cat_kid
	syscall
	j end

is_young:
	li $v0, 4
	la $a0, cat_young
	syscall
	j end
	
is_adult:
	li $v0, 4
	la $a0, cat_adult
	syscall
	j end
	
is_old:
	li $v0, 4
	la $a0, cat_old
	syscall
	j end
	
end:
	li $v0, 10
	syscall
