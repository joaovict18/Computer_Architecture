li $t0, 1
li $t1, 2
li $t2, 3
li $t3, 4
li $t4, 5

sw $t0, 24($s6) # Saves 1 in adress 24
sw $t1, 32($s6) # Saves 2 in adress 24
sw $t2, 36($s6) # Saves 3 in adress 24
sw $t3, 38($s6) # Saves 4 in adress 24
sw $t4, 40($s6) # Saves 5 in adress 24

# 5 li instructions and 5 sw instructions
# without immediate instructions, we'll need to, each sw a pair of addi (to calculate the new offset) and 
# sw (to salve with zero offset), that become: 4 addi instructions and sw instructions, results in 14 
# instructions in total