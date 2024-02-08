cmake_minimum_required(VERSION 3.15) # Ensure compatibility with CMakeDeps and CMakeToolchain

project(OpenSourceProject VERSION 1.0)

# Enable the generation of the compilation database
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Set the C++ standard for the project
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find the GTest package provided by Conan
find_package(GTest CONFIG REQUIRED)

# Include the components directory
add_subdirectory(components)

# Include the tests directory
add_subdirectory(tests)

# Compiler-specific options
if(MSVC)
    target_compile_options(OpenSourceExecutable PRIVATE /W4 /MT)
else()
    target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
    # Integrate Clang-Tidy if the compiler is Clang
    set(CMAKE_CXX_CLANG_TIDY clang-tidy)
endif()

enable_testing()

# Add a custom target for applying Clang-Format
file(GLOB_RECURSE ALL_SOURCE_FILES components/*.cpp components/*.h tests/*.cpp tests/*.h)
add_custom_target(
    format
    COMMAND clang-format -i ${ALL_SOURCE_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Running Clang-Format on all source files"
)
