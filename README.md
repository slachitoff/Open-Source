# Open-Source Project

This repository serves as a template for C++ projects using a component-based architecture. It demonstrates best practices in organizing code, managing dependencies, ensuring code quality, and conducting tests.

## Prerequisites

Before building the project, ensure you have CMake, Conan, and Ninja installed on your system. These tools are essential for configuring, building, and managing dependencies.

### Installing CMake

CMake is a cross-platform build system generator. To install CMake:

- **Windows**: Download the installer from the [CMake Downloads page](https://cmake.org/download/) and follow the installation prompts. Ensure you select the option to add CMake to your system PATH.
- **macOS**: Use Homebrew by running `brew install cmake` in the terminal, or download the macOS binary from the CMake website.
- **Linux**: Most distributions include CMake in their package managers. For example, on Ubuntu, you can install it with `sudo apt-get install cmake`.

### Installing Conan

Conan is a C++ package manager that simplifies dependency management. To install Conan:

- **All Platforms**: Conan can be installed via Python's package manager pip. First, ensure you have Python and pip installed. Then, run `pip install conan` in your terminal or command prompt.

### Installing Ninja

Ninja is a small build system focused on speed. To install Ninja:

- **Windows**: Download the latest binary from Ninja's [GitHub releases page](https://github.com/ninja-build/ninja/releases). Extract the executable and add its location to your system's PATH.
- **macOS and Linux**: Ninja can be installed through Homebrew on macOS (`brew install ninja`) or through the package manager on Linux (for example, `sudo apt-get install ninja-build` on Ubuntu).

## Building the Project

This project uses CMake as its build system and Conan for dependency management, with Ninja as the preferred build system generator for its efficiency and speed. Follow these steps to build the project:
1. **Install Dependencies**:
    Ensure you have CMake, Conan, and Ninja installed on your system. Ninja can be installed from its [GitHub releases page](https://github.com/ninja-build/ninja/releases) and should be added to your system's PATH.

2. **Configure the Build**:
    Create a build directory, and use Conan to install dependencies. Then configure the project with CMake using Ninja as the generator.
    ```sh
    mkdir build && cd build
    conan install .. --build=missing -s build_type=Debug -of .
    cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake ..
    ```

3. **Compile the Project**:
    Compile the project with Ninja.
    ```sh
    cmake .. -G "Ninja"
    ```

4. **Run Clang-Tidy**:
    Perform static code analysis with Clang-Tidy to ensure code quality. Make sure `compile_commands.json` is generated in your build directory.
    ```sh
    clang-tidy ../components/HelloWorld/main.cpp
    ```

5. **Run Tests**:
    Execute the test suite to verify the correctness of your code. Assuming tests are compiled into an executable named `MyTests`.
    ```sh
    cd /tests/HelloWorldTests
    MyTests
    ```

## Code Formatting

To maintain code consistency, we enforce strict formatting guidelines. Use the following command to check and apply code formatting rules using `clang-format`.

- **Check Formatting**:
    To check for formatting issues, run:
    ```powershell
    .\scripts\check-formatting.ps1
    ```

- **Apply Formatting**:
    To automatically format your code according to our project's standards, execute:
    ```sh
    clang-format -i $(find ./src ./include -name '*.h' -o -name '*.cpp')
    ```

Please ensure your contributions adhere to the specified guidelines and pass all tests before submitting a pull request.