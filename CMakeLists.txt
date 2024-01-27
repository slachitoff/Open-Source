# Specify the minimum version for CMake
cmake_minimum_required(VERSION 3.10)

# Project's name and version
project(OpenSourceProject VERSION 1.0)

# Use C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the executable
add_executable(OpenSourceExecutable src/main.cpp)
# If you have more source files, add them here like:
# add_executable(OpenSourceExecutable src/main.cpp src/other_file.cpp)

# Include directories
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Link any libraries if necessary
# target_link_libraries(OpenSourceExecutable PRIVATE SomeLibrary)

# Compiler options, here added extra warnings
target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)

# Optional: If you have subdirectories like for tests, add them
# add_subdirectory(tests)

# Optional: Install rules, specify how to install your project
# install(TARGETS OpenSourceExecutable DESTINATION bin)

# Optional: Enable testing and add the test subdirectory
# enable_testing()
# add_subdirectory(tests)