.data
	# Puts this value bellow
	pal1: .word 0x10203040
	# Reserves a blank space 
	pal2: .space 4
	# Puts that in adress 0xfffffff
	pal3: .word 0xffffffff
.text
main: 
	# Loads the value in pal1 address in $s0
	lw $s0,pal1($0)
	# Stores the value
	sw $s0,pal2($0)
	# Writes $s0 value over $s0 value already
	sw $s0,pal3($0)