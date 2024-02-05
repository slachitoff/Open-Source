cmake_minimum_required(VERSION 3.15) # Ensure compatibility with CMakeDeps and CMakeToolchain

project(OpenSourceProject VERSION 1.0)

# Set the C++ standard for the project
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Conan setup (if you're using conan_cmake_run or similar)
# include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
# conan_basic_setup(TARGETS)

# Find the GTest package provided by Conan
find_package(GTest CONFIG REQUIRED)

# After find_package(GTest CONFIG REQUIRED)
get_target_property(GTEST_INCLUDE_DIRS GTest::gtest INTERFACE_INCLUDE_DIRECTORIES)
message(STATUS "GTest include directories: ${GTEST_INCLUDE_DIRS}")

# Automatically include all component directories if they exist
file(GLOB COMPONENT_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/components/*")
foreach(COMPONENT_DIR IN LISTS COMPONENT_DIRS)
    if(IS_DIRECTORY ${COMPONENT_DIR})
        add_subdirectory(${COMPONENT_DIR})
    endif()
endforeach()

# Define your executable
add_executable(OpenSourceExecutable src/main.cpp)
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Compiler-specific options
if(MSVC)
    # Adjust these options as necessary for your project
    target_compile_options(OpenSourceExecutable PRIVATE /W4 /MT)
else()
    target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
endif()

# Define the test executable
add_executable(MyTests tests/my_tests.cpp)
target_link_libraries(MyTests GTest::gtest GTest::gtest_main) # Link with Conan-provided targets

enable_testing()
include(GoogleTest)
gtest_discover_tests(MyTests)
