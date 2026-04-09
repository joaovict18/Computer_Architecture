// Source 1
int f(int a, int b, int c) {
	int result = b + a;
	
	if (c != 0) {	// bnez $a2, L (test's $a2 argument, not the result)
		return result;	// L: jr $v0
	}
	
	return a - b;
}

// Source 2
int f(int a, int b, int c, int d) {
	int result = d  + a
	
	if (result < a) {
		return b; // If slt result in 1, it won't pass and executes jr $ra
	}
	else {
		return g(b) // If slt results in 0, it'll pass and moves b to $a0 and calls g
	}
}