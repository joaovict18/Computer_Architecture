# The error in the first one, is on the use of $v0 to store the result of a sum, that can be solve by using
# $ra, and returning it on f

# The error in the second one, is on the call of jal to g, without saving $ra on the stack, it can be solve
# by creating a prologue and an epilgue