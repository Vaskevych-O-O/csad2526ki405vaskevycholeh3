# Laboratory Work №1 — Automation of a Cross-Platform “Hello World” Project

## 🧪 Topic
Automation of a cross-platform “Hello World” project using **GitHub Copilot**, **CMake**, and **GitHub Actions**.

## 🎯 Objective
To gain practical skills in using modern automation tools for software development and CI/CD (Continuous Integration / Continuous Delivery).  
At this stage, the focus is on creating a **CMake build configuration** using **GitHub Copilot**.

---

## 👨‍💻 Student Information
- **Student**: Vaskevych Oleh  
- **Group**: KI-405  

---

## 📂 Repository Structure
```
.
├── tests/
│    └── unit_tests.cpp  # Unit tests for math operations (Stage 3)
├── main.cpp             # Main program file (Stage 1)
├── CMakeLists.txt       # CMake configuration file (Stage 2)
├── math_operations.h    # Declaration of functions (Stage 3)
├── math_operations.cpp  # Implementation of functions (Stage 3)
├── ci.sh                # CI build script for Linux/macOS (Stage 4)
├── Copilot-logs1.txt    # Copilot chat logs from Stage 1
├── Copilot-logs2.txt    # Copilot chat logs from Stage 2
├── Copilot-logs3.txt    # Copilot chat logs from Stage 3
├── Copilot-logs4.txt    # Copilot chat logs from Stage 4
└── README.md            # Project documentation
```

---

## 🧱 Current Progress

### ✅ Stage 1 — Project Initialization
- Repository created in GitHub Codespaces  
- Basic “Hello World” program generated using GitHub Copilot  
- Copilot interaction history saved in `Copilot-logs1.txt`

### ✅ Stage 2 — Generating `CMakeLists.txt`
Using GitHub Copilot, a minimal CMake configuration was generated for building the project on multiple platforms.

**Generated configuration:**
```cmake
cmake_minimum_required(VERSION 3.10)
project(HelloWorld)

set(CMAKE_CXX_STANDARD 17)
add_executable(hello main.cpp)
```

The configuration enables easy compilation of the “Hello World” program using CMake on Windows, Linux, and macOS.

All Copilot interactions for this stage are saved in the file:  
`Copilot-logs2.txt`

### ✅ Stage 3 — Unit Testing with Google Test

Using GitHub Copilot, unit testing was added to verify program functionality.

**Files created:**
- `math_operations.h` — declaration of `int add(int a, int b);`
- `math_operations.cpp` — implementation of the function
- `tests/unit_tests.cpp` — contains unit tests written using Google Test framework

Also updated CMake configuration with Copilot to include Google Test support and build a separate test executable.

Copilot interaction logs for this stage are saved in the file:
`Copilot-logs3.txt`

### 🧪 How to add a test file and run tests

To add a new unit test using Google Test in this project:

1. Create a test source file under `tests/`, for example `tests/my_test.cpp`.

2. In the test source file, include your headers and write tests using the Google Test macros. Example skeleton:

```cpp
#include "../math_operations.h"
#include <gtest/gtest.h>

TEST(AdditionTest, PositiveNumbers) {
	EXPECT_EQ(add(2, 3), 5);
}

TEST(AdditionTest, NegativeNumbers) {
	EXPECT_EQ(add(-4, -6), -10);
}

int main(int argc, char **argv) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}
```

3. The project's `CMakeLists.txt` already uses FetchContent to download Google Test and defines a `unit_tests` target. Re-run CMake and build:

```bash
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -- -j
```

4. Run tests with CTest (recommended) or run the test binary directly:

```bash
# using CTest
ctest --test-dir build --output-on-failure

# or run the binary directly
./build/unit_tests
```

Notes:
- Add any new test files to the `unit_tests` target in `CMakeLists.txt` if you create separate test executables.
- During the first configure step CMake will download Google Test. Ensure your environment has network access.


### 🏗️ Stage 4 — CI Script for Local Building

At this stage, **a local CI script (`ci.sh`)** was created using **GitHub Copilot** to automate the build and testing process.
The script simulates continuous integration locally by performing the following actions:

---

**🔧 Fixes and Improvements**

- **Fixed** the incorrect Google Test linking in `CMakeLists.txt`, ensuring successful build and test discovery.

- **Updated** `unit_tests.cpp` to use the proper Google Test framework structure.

- **Verified** that CTest now correctly recognizes and runs all unit tests during the CI build.

---

**🧩 Updated `unit_tests.cpp`**
```cpp
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
```

This ensures full compatibility with Google Test and provides better test coverage.

---

**⚙️ Script Overview**
**File: `ci.sh`**

1. Cleans the build directory (if exists)
2. Configures the project with CMake
3. Builds all targets (`hello` and `unit_tests`)
4. Runs all available tests

**Script contents (`ci.sh`):**
```bash
#!/bin/bash

# To make this script executable, run:
#   chmod +x ci.sh

# Exit immediately if any command fails
set -e

# Create build directory if it doesn't exist
mkdir -p build

# Change into build directory
cd build

# Run CMake configuration
cmake ..

# Build the project
cmake --build .

# Run tests
ctest --output-on-failure
```

**Usage:**
```bash
chmod +x ci.sh
./ci.sh
```

This ensures consistent local builds and makes it easy to extend the process for **GitHub Actions CI/CD** in the next stage.
All Copilot interactions for this stage are saved in `Copilot-logs4.txt`.

---

## 🚀 Next Stages 
1. Configure GitHub Actions workflow for automatic builds  
2. Verify CI/CD execution across all platforms  

---

## 📧 Contacts
- **GitHub**: [Vaskevych-O-O](https://github.com/Vaskevych-O-O)