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

### 🏗️ Stage 2 — Generating `CMakeLists.txt`
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

---

## 🚀 Next Stages
1. Add unit testing with Google Test  
2. Implement CI build scripts (`ci.sh` / `ci.cmd`)  
3. Configure GitHub Actions workflow for automatic builds  
4. Verify CI/CD execution across all platforms  

---

## 📧 Contacts
- **GitHub**: [Vaskevych-O-O](https://github.com/Vaskevych-O-O)