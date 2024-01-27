# Specify the minimum version for CMake
cmake_minimum_required(VERSION 3.10)

# Project's name and version
project(OpenSourceProject VERSION 1.0)

# Use C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the executable for your main application
add_executable(OpenSourceExecutable src/main.cpp)

# Include directories for your main application
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Compiler options for your main application
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  target_compile_options(OpenSourceExecutable PRIVATE /Wall /MTd) # Add /MTd here
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
else()
  message(FATAL_ERROR "Unsupported compiler")
endif()

# ---- Google Test Integration ----
include(FetchContent)

# Specify the version and URL of Google Test
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.0  
)

# Enable and configure Google Test
FetchContent_MakeAvailable(googletest)

# Create a separate target for your tests
add_executable(MyTests tests/my_tests.cpp)

# Set compiler options for MyTests target
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  target_compile_options(MyTests PRIVATE /MTd) # Add /MTd here
endif()

# Link Google Test to your test target
target_link_libraries(MyTests gtest_main)

# Add a test target to run your tests
include(GoogleTest)
gtest_discover_tests(MyTests)

# ---- End of Google Test Integration ----

# Optional: If you have subdirectories like for tests, add them
# add_subdirectory(tests)

# Optional: Install rules, specify how to install your project
# install(TARGETS OpenSourceExecutable DESTINATION bin)

# Optional: Enable testing and add the test subdirectory
# enable_testing()
# add_subdirectory(tests)
