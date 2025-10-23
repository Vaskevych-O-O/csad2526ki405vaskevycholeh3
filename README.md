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
├── main.cpp             # Main program file (Stage 1)
├── CMakeLists.txt       # CMake configuration file (Stage 2)
├── Copilot-logs1.txt    # Copilot chat logs from Stage 1
├── Copilot-logs2.txt    # Copilot chat logs from Stage 2
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

### 🏗️ Stage 3 — Unit Testing with Google Test

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


---

## 🚀 Next Stages
1. Implement CI build scripts (`ci.sh` / `ci.cmd`)  
2. Configure GitHub Actions workflow for automatic builds  
3. Verify CI/CD execution across all platforms  

---

## 📧 Contacts
- **GitHub**: [Vaskevych-O-O](https://github.com/Vaskevych-O-O)