cmake_minimum_required(VERSION 3.15) # CMakeDeps and CMakeToolchain recommend CMake 3.15 or higher

project(OpenSourceProject VERSION 1.0)

# Set the C++ standard for the project
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find the GTest package (assumes CMakeDeps generator has been used)
find_package(GTest CONFIG REQUIRED)

# Define your executable
add_executable(OpenSourceExecutable src/main.cpp)
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Compiler-specific options
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    target_compile_options(OpenSourceExecutable PRIVATE /Wall /MTd)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
else()
    message(WARNING "Compiler not officially supported: ${CMAKE_CXX_COMPILER_ID}")
endif()

# Define the test executable
add_executable(MyTests tests/my_tests.cpp)
target_link_libraries(MyTests GTest::gtest GTest::gtest_main) # Use targets provided by CMakeDeps generator

enable_testing()
include(GoogleTest)
gtest_discover_tests(MyTests)
