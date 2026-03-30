# Initialize two variables
addi $s0, $zero, 19
addi $s1, $zero, 22

# Take the value of s0, increase by 1 and subtract by the value of the second variable
add $s0, $s0, 1 
sub $s0, $s0, $s1
