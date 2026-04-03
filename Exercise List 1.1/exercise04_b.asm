.data
	pal1: .word 0x10203040
	pal2: .space 4
	pal3: .word 0xffffffff
.text
main: 
	# Loads pal1 value in $s0
	lw $s0,pal1
	# Stores $s0 value in pal2
	sw $s0,pal2
	# Does the same thing
	sw $s0,pal3+0