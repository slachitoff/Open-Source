cmake_minimum_required(VERSION 3.10)

project(OpenSourceProject VERSION 1.0)

# Conan setup should be done after the project is defined
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(OpenSourceExecutable src/main.cpp)
target_include_directories(OpenSourceExecutable PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  target_compile_options(OpenSourceExecutable PRIVATE /Wall /MTd)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  target_compile_options(OpenSourceExecutable PRIVATE -Wall -Wextra)
else()
  message(WARNING "Compiler not officially supported: ${CMAKE_CXX_COMPILER_ID}")
endif()

# Google Test Integration with Conan
# Conan has already installed GoogleTest and set up targets

find_package(GTest REQUIRED)

add_executable(MyTests tests/my_tests.cpp)

# Link Google Test to your test target using Conan-provided targets
target_link_libraries(MyTests ${CONAN_LIBS})

# Compiler options for MyTests target, if necessary
if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  target_compile_options(MyTests PRIVATE /MTd)
endif()

enable_testing()
include(GoogleTest)
gtest_discover_tests(MyTests)
