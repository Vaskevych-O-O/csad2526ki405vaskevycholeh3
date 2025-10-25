
#include <iostream>
#include "../math_operations.h"

static int run_tests() {
	int failures = 0;

	// Test 1: simple positive numbers
	if (add(2, 3) != 5) {
		std::cerr << "Test failed: add(2,3) != 5\n";
		++failures;
	}

	// Test 2: zeros
	if (add(0, 0) != 0) {
		std::cerr << "Test failed: add(0,0) != 0\n";
		++failures;
	}

	// Test 3: negatives
	if (add(-4, -6) != -10) {
		std::cerr << "Test failed: add(-4,-6) != -10\n";
		++failures;
	}

	// Test 4: mixed
	if (add(-3, 7) != 4) {
		std::cerr << "Test failed: add(-3,7) != 4\n";
		++failures;
	}

	return failures;
}

int main() {
	int failures = run_tests();
	if (failures == 0) {
		std::cout << "All tests passed\n";
		return 0;
	} else {
		std::cerr << failures << " test(s) failed\n";
		return 1;
	}
}

