# Student: João Victor Medeiros Gondim 

.text

# strlen
# Counts characters in a string until \0
strlen:
	addi	$sp, $sp, -4
	sw	$s0, 0($sp)
	li	$v0, 0
	move	$s0, $a0

loop_strlen:
	lb	$t0, 0($s0)
	beq	$t0, $zero, exit_strlen
	addi	$v0, $v0, 1
	addi	$s0, $s0, 1
	j	loop_strlen

exit_strlen:
	lw	$s0, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra


# strcmp
# Compares the length of two strings using the strlen
strcmp:
	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$s0, 4($sp)
	sw	$s1, 0($sp)

	move	$s1, $a1
	jal	strlen
	move	$s0, $v0	# Length of the first one

	move	$a0, $s1
	jal	strlen
	move	$t1, $v0	# Length of the second one

	beq	$s0, $t1, equal_cmp
	blt	$s0, $t1, less_cmp
	li	$v0, 1		# Case first is longer
	j	done_strcmp

less_cmp:
	li	$v0, -1		# Case second is longer
	j	done_strcmp

equal_cmp:
	li	$v0, 0		# Case same length

done_strcmp:
	lw	$s1, 0($sp)
	lw	$s0, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jr	$ra


# strcat
# Finds the end of the first string and adds the second one
strcat:
	move	$t0, $a0
find_end_cat:
	lb	$t1, 0($t0)
	beq	$t1, $zero, loop_strcat
	addi	$t0, $t0, 1
	j	find_end_cat
loop_strcat:
	lb	$t1, 0($a1)
	sb	$t1, 0($t0)
	beq	$t1, $zero, exit_strcat
	addi	$a1, $a1, 1
	addi	$t0, $t0, 1
	j	loop_strcat
exit_strcat:
	jr	$ra


# strncat
# Appends a specific number of characters n to the end of a string
strncat:
	move	$t0, $a0
find_end_ncat:
	lb	$t1, 0($t0)
	beq	$t1, $zero, append_ncat
	addi	$t0, $t0, 1
	j	find_end_ncat
append_ncat:
	li	$t2, 0		# Counter for n characters
loop_ncat:
	beq	$t2, $a2, null_ncat
	lb	$t3, 0($a1)
	sb	$t3, 0($t0)
	beq	$t3, $zero, exit_ncat
	addi	$a1, $a1, 1
	addi	$t0, $t0, 1
	addi	$t2, $t2, 1
	j	loop_ncat
null_ncat:
	sb	$zero, 0($t0)	# Adds the null terminator at the end
exit_ncat:
	jr	$ra


# strncpy
# Copies n characters from the source string to the dest
strncpy:
	li	$t0, 0		# Index i = 0
loop_strncpy:
	beq	$t0, $a2, exit_strncpy
	add	$t1, $a1, $t0
	lb	$t2, 0($t1)
	add	$t3, $a0, $t0
	sb	$t2, 0($t3)
	beq	$t2, $zero, exit_strncpy
	addi	$t0, $t0, 1
	j	loop_strncpy
exit_strncpy:
	jr	$ra
