# 🔬 Laboratory Works — Automation and FPGA Communication Protocols

## 👨‍💻 Student Information
- **Student**: Vaskevych Oleh  
- **Group**: KI-405  

---

## 📂 Repository Structure
```
.
├── .github/
│     └── workflows/
│             └── ci.yml    # GitHub Actions workflow file (Lab 1 Stage 5)
├── src/ 
│    ├── spi_master_rx.vhd  # SPI Master Receiver module (Lab 2 Stage 2)
│    └── spi_master_tx.vhd  # SPI Master Transmitter module (Lab 2 Stage 2)
├── tests/
│    └── unit_tests.cpp     # Unit tests for math operations (Lab 1 Stage 3)
├── main.cpp                # Main program file (Lab 1 Stage 1)
├── CMakeLists.txt          # CMake configuration file (Lab 1 Stage 2)
├── math_operations.h       # Declaration of functions (Lab 1 Stage 3)
├── math_operations.cpp     # Implementation of functions (Lab 1 Stage 3)
├── ci.sh                   # CI build script for Linux/macOS (Lab 1 Stage 4)
├── Copilot-logs1.txt       # Copilot chat logs from Lab 1 Stage 1
├── Copilot-logs2.txt       # Copilot chat logs from Lab 1 Stage 2
├── Copilot-logs3.txt       # Copilot chat logs from Lab 1 Stage 3
├── Copilot-logs4.txt       # Copilot chat logs from Lab 1 Stage 4
└── README.md               # Project documentation
```

## 📚 Laboratory Works Overview

### 🧩 Table of Contents
1. [Laboratory Work №1 — Automation of a Cross-Platform “Hello World” Project](#laboratory-work-1--automation-of-a-cross-platform-hello-world-project) ✅
2. [Laboratory Work №2 — Development and Verification of Sequential Communication Protocols on PLIS](#laboratory-work-2--development-and-verification-of-sequential-communication-protocols-on-plis)

# Laboratory Work №1 — Automation of a Cross-Platform “Hello World” Project

## 🧪 Topic
Automation of a cross-platform “Hello World” project using **GitHub Copilot**, **CMake**, and **GitHub Actions**.

## 🎯 Objective
To gain practical skills in using modern automation tools for software development and CI/CD (Continuous Integration / Continuous Delivery).  
At this stage, the focus is on creating a **CMake build configuration** using **GitHub Copilot**.

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


### ✅ Stage 4 — CI Script for Local Building

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

### ✅ Stage 5 — GitHub Actions Workflow (ci.yml)

At this stage, a **cross-platform GitHub Actions workflow** was created to automate the build and testing process directly in the cloud.

Using **GitHub Copilot Chat**, a ci.yml workflow file was generated inside .github/workflows/.

**Workflow features:**

- **Trigger**: runs on every `push` or `pull_request` to branches containing `develop` or `master` in their name.
- **Job**: one job named `cross_build`.
- **Strategy Matrix**: executes the build on
    - `ubuntu-latest`
    - `windows-latest`
    - `macos-latest`

- **Steps included in each build**:

1. Checkout repository using actions/checkout@v4
2. Install CMake (if not available)
3. Run the configuration and build process via ci.sh
4. Deploy step (currently a placeholder)

All Copilot interactions for this stage are saved in `Copilot-logs5.txt`. 

### ✅ Stage 6 — CI/CD launch and verification

At this stage, a **cross-platform GitHub Actions workflow** was checked to automate the build and testing process directly in the cloud.

All **GitHub Actions** were successful and were merged into the main branch.

---

# Laboratory Work №2 — Development and verification of sequential communication protocols on PLIS

## 🧪 Topic
Development and verification of sequential communication protocols on PLIS

## 🎯 Objective
Acquire skills in designing high-speed synchronous and asynchronous 
interfaces, which are key elements of computer systems. In particular: 

1. Design a serial communication protocol module (UART, SPI, 
or I2C) according to an individual option. 
2. Use a hardware description language (VHDL or Verilog) to create 
a functional model. 
3. Develop a test bench for functional verification of data transmission and reception .
4. Analyze the timing characteristics of the project after synthesis. 

---

## 🧱 Current Progress

### ✅ Stage 1 — Option determination and protocol analysis
**Individual option:** №3

**Protocol:** SPI (Serial Peripheral Interface)

**Language:** VHDL

#### 🔍 **Protocol Analysis**

SPI (Serial Peripheral Interface) is a **synchronous serial communication protocol** used for data exchange between a **Master** and one or more **Slave** devices.
Communication is performed via four main lines:

- **MOSI (Master Out Slave In)** — data transmission from Master to Slave
- **MISO (Master In Slave Out)** — data transmission from Slave to Master
- **SCK (Serial Clock)** — clock signal generated by the Master
- **SS (Slave Select)** — used to select the active Slave (active low)

#### ⚙️ Timing and Operation
SPI operates in four modes, defined by the clock polarity (CPOL) and clock phase (CPHA) bits:
| **Mode** | **CPOL** | **CPHA** | **Description**                                          |
| ---- | ---- | ---- | ---------------------------------------------------- |
| 0    | 0    | 0    | Data sampled on rising edge, shifted on falling edge |
| 1    | 0    | 1    | Data sampled on falling edge, shifted on rising edge |
| 2    | 1    | 0    | Data sampled on falling edge, shifted on rising edge |
| 3    | 1    | 1    | Data sampled on rising edge, shifted on falling edge |

During each data transfer, the Master initiates communication, provides the clock (SCK), and controls the SS line.
Data is shifted bit by bit on each clock edge.

#### 🧩 **Finite State Machine (FSM) — Transmitter (Tx)**

The transmitter (Tx) module can be represented as a finite state machine with the following states:

1. **IDLE** — waiting for SS to become active (`SS = 0`).
2. **LOAD** — loading the data byte into a shift register.
3. **SHIFT** — shifting out bits through MOSI, synchronized with SCK edges.
4. **DONE** — indicates that transmission is complete.
5. **RETURN TO IDLE** — resets and prepares for the next transfer.

#### 📡 **Receiver (Rx) Logic**

The receiver (Rx) operates synchronously with the clock signal (SCK).

- On each active clock edge, it reads the bit value from the MOSI line.
- The received bits are shifted into a register.
- After receiving 8 bits, a complete byte is formed and a data-ready flag is set.
- When `SS = 1`, the receiver returns to the **IDLE** state.

#### 📘 **FSM Diagram Overview**

The simplified state diagram of the SPI transmitter can be described as:
```css
[IDLE] → [LOAD] → [SHIFT] → [DONE] → [IDLE]
```


### ✅ Stage 2 — Module development (Encoder/Decoder) 
During this stage, the **HDL implementation** of the SPI protocol was developed using VHDL.
Two separate modules were created to represent the **Master Transmitter (Tx)** and **Master Receiver (Rx)** components of the SPI interface.

#### 🧱 **Created Files**

- `src/spi_master_tx.vhd` — SPI Master Transmitter module
- `src/spi_master_rx.vhd` — SPI Master Receiver module


## 📧 Contacts
- **GitHub**: [Vaskevych-O-O](https://github.com/Vaskevych-O-O)