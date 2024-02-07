cmake_minimum_required(VERSION 3.15) # Ensure compatibility with CMakeDeps and CMakeToolchain

project(OpenSourceProject VERSION 1.0)

# Set the C++ standard for the project
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find the GTest package provided by Conan
find_package(GTest CONFIG REQUIRED)

# Include all component directories if they exist
file(GLOB COMPONENT_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/components/*")
foreach(COMPONENT_DIR IN LISTS COMPONENT_DIRS)
    if(IS_DIRECTORY ${COMPONENT_DIR})
        add_subdirectory(${COMPONENT_DIR})
    endif()
endforeach()

# Define the main executable
add_executable(OpenSourceExecutable src/main.cpp)
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Compiler-specific options
if(MSVC)
    target_compile_options(OpenSourceExecutable PRIVATE /W4 /MT)
else()
    target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
    # Integrate Clang-Tidy if the compiler is Clang
    set(CMAKE_CXX_CLANG_TIDY clang-tidy)
endif()

# Define the test executable
add_executable(MyTests tests/my_tests.cpp)
target_link_libraries(MyTests GTest::gtest GTest::gtest_main)

enable_testing()
include(GoogleTest)
gtest_discover_tests(MyTests)

# Add a custom target for applying Clang-Format
file(GLOB_RECURSE ALL_SOURCE_FILES *.cpp *.h)
add_custom_target(
    format
    COMMAND clang-format -i ${ALL_SOURCE_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Running Clang-Format on all source files"
)
