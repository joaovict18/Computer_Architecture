# After the function returns, the $sp is restored to 0x7fffeffc by adding 4, effectively deallocating the 
# stack frame. The saved $ra remains in memory at 0x7fffeff8 but is now considered "garbage" data since it 
# is above the current stack pointer.