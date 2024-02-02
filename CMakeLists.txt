cmake_minimum_required(VERSION 3.15) # CMakeDeps and CMakeToolchain recommend CMake 3.15 or higher

# Include the Conan toolchain file for dependency management
include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

project(OpenSourceProject VERSION 1.0)

# Set the C++ standard for the project
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories for the project
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

# Add components directory
add_subdirectory(components)

# Define the executable that uses the components
add_executable(OpenSourceExecutable src/main.cpp)
# Link the executable with the components (if components define libraries)
# target_link_libraries(OpenSourceExecutable PRIVATE component_lib_name)

# Compiler-specific options
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    target_compile_options(OpenSourceExecutable PRIVATE /Wall /MTd)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
else()
    message(WARNING "Compiler not officially supported: ${CMAKE_CXX_COMPILER_ID}")
endif()

# Find and link GTest for unit testing
find_package(GTest CONFIG REQUIRED)
add_executable(MyTests tests/my_tests.cpp)
target_link_libraries(MyTests GTest::gtest GTest::gtest_main)

enable_testing()
include(GoogleTest)
gtest_discover_tests(MyTests)
