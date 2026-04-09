# Converting the first one to hex: 0010 0000 0001 0100 1001 0010 0100 1001 -> 0x20149249
# Converting the second one to hex: 0000 1111 1011 1110 0100 0000 0000 0000 -> 0x0FBE4000

# To the value 1
lui $t1, 0x2014
ori $t1, $t1, 0x9249


# To the value 2
lui $t1, 0x0FBE
