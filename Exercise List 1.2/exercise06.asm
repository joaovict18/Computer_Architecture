# In case A, it results in $t2 = 1 because $t0 is smaller than $t1, making the slt condition true and skipping 
# the ELSE branch.
# in case B, it results in $t2 = 2 because $t0 is larger than $s1, causing the beq to jump to ELSE and 
# overwrite $t2 with the value 2.