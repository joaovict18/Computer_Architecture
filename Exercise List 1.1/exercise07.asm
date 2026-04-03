.data

    prompt1: .asciiz "Enter first number: "
    prompt2: .asciiz "Enter second number: "
    txt_n1: .asciiz "\nNumber 1: "
    txt_n2: .asciiz "Number 2: "
    txt_res: .asciiz "Multiplication result: "
    space: .asciiz "\n"

.text
.globl main

main:
    # Promps for the inputs

    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0       

    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Lace init
    li $s0, 0           # Acumulate result
    li $t2, 0           # Counter

    # Case it is a multiplication by 0
    beq $t1, $zero, shows_result

# Lace
loop_mult:
    # Stop condition
    beq $t2, $t1, shows_result
    
    add $s0, $s0, $t0
    addi $t2, $t2, 1
    
    j loop_mult   # Takes back for the init


shows_result:
    # Prints N1
    li $v0, 4
    la $a0, txt_n1
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Prints N1
    li $v0, 4
    la $a0, space
    syscall
    li $v0, 4
    la $a0, txt_n2
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    # Prints result
    li $v0, 4
    la $a0, space
    syscall
    li $v0, 4
    la $a0, txt_res
    syscall
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall