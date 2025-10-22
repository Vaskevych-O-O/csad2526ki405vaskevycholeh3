
cmake_minimum_required(VERSION 3.10)

project(hello_world LANGUAGES CXX)

# Use C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Create executable from main.cpp
add_executable(hello main.cpp)

# Simple install support
install(TARGETS hello DESTINATION bin)

# Optionally enable testing target that runs the executable and checks its output
enable_testing()
add_test(NAME HelloRuns COMMAND hello)
