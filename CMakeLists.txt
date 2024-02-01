cmake_minimum_required(VERSION 3.10)

project(OpenSourceProject VERSION 1.0)

# Include the Conan-generated file
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
# This automatically calls conan_basic_setup()
conan_basic_setup(TARGETS)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(OpenSourceExecutable src/main.cpp)
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  target_compile_options(OpenSourceExecutable PRIVATE /Wall /MTd)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
else()
  message(WARNING "Compiler not officially supported: ${CMAKE_CXX_COMPILER_ID}")
endif()

# Link Google Test to your test target using Conan-provided targets
add_executable(MyTests tests/my_tests.cpp)
target_link_libraries(MyTests CONAN_PKG::gtest)

enable_testing()
include(GoogleTest)
gtest_discover_tests(MyTests)
