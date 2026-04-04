# In both cases, $t2 results in 0 because the sll operation shifts the values left, causing any potential 
# negative sign bits to be discarded. Since the resulting values in $t0 are both positive (MSB is 0) after 
# the shift, the slt condition against $0 becomes false.