cmake_minimum_required(VERSION 3.15)
project(OpenSourceProject VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# No need to manually specify GTest location with Conan CMakeDeps

# Include the directories and link against GTest (handled by Conan)
# Define your executable
add_executable(OpenSourceExecutable src/main.cpp)
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Define the test executable
add_executable(MyTests tests/my_tests.cpp)
# With CMakeDeps, use the package name directly
target_link_libraries(MyTests GTest::gtest GTest::gtest_main)

enable_testing()
include(GoogleTest)
gtest_discover_tests(MyTests)
