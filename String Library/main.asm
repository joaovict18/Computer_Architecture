# Student: João Victor Medeiros Gondim 

.data
	text1:		.asciiz "hello"
	text2:		.asciiz "word"
			.space 100			
	
	menu_msg:	.asciiz "\n[1]strlen [2]strcmp [3]strncat [4]strcat [5]strncpy [0]Leave: "
	res_msg:	.asciiz "Result: "
	breaks_line:	.asciiz "\n"

.text
.globl main
.include "string.asm"

main:
	# Show menu to user
	la	$a0, menu_msg
	li	$v0, 4
	syscall

	# Read input from user
	li	$v0, 5
	syscall
	move	$t0, $v0		
	
	beq	$t0, 0, end

	# Print "Result: " prefix
	la	$a0, res_msg
	li	$v0, 4
	syscall

	beq	$t0, 1, strlen_path
	beq	$t0, 2, strcmp_path
	beq	$t0, 3, strncat_path
	beq	$t0, 4, strcat_path
	beq	$t0, 5, strncpy_path
	j	main

strlen_path:
	# Calculates and prints character count of the string
	la	$a0, text2
	jal	strlen
	move	$a0, $v0
	li	$v0, 1
	syscall
	jal	print_newline
	j	main

strcmp_path:
	# Compares two strings and returns 1, -1, or 0 depending on what strings is
	la	$a0, text2
	la	$a1, text1
	jal	strcmp
	move	$a0, $v0
	li	$v0, 1
	syscall
	jal	print_newline
	j	main

strncat_path:
	# Appends n characters from source to the end of dest
	la	$a0, text2
	la	$a1, text1
	li	$a2, 3		# Concatenates 3 chars
	jal	strncat
	la	$a0, text2
	li	$v0, 4
	syscall
	jal	print_newline
	j	main

strcat_path:
	# Appends the entire source string to the end of dest
	la	$a0, text2
	la	$a1, text1
	jal	strcat
	la	$a0, text2
	li	$v0, 4
	syscall
	jal	print_newline
	j	main

strncpy_path:
	# Copies n characters from source to dest, overwriting it
	la	$a0, text2
	la	$a1, text1
	li	$a2, 2		# Copies 2 chars
	jal	strncpy
	la	$a0, text2
	li	$v0, 4
	syscall
	jal	print_newline
	j	main

# Print a line break
print_newline:
	la	$a0, breaks_line
	li	$v0, 4
	syscall
	jr	$ra

end:
	# Ends the program
	li	$v0, 10
	syscall
