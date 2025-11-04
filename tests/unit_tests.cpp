
#include <gtest/gtest.h>
#include "../math_operations.h"

// Test suite for addition function
TEST(AdditionTest, PositiveNumbers) {
    EXPECT_EQ(add(2, 3), 5);
}

TEST(AdditionTest, Zeros) {
    EXPECT_EQ(add(0, 0), 0);
}

TEST(AdditionTest, NegativeNumbers) {
    EXPECT_EQ(add(-4, -6), -10);
}

TEST(AdditionTest, MixedNumbers) {
    EXPECT_EQ(add(-3, 7), 4);
}

