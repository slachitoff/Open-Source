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

### Configuring Conan to Use Ninja

To ensure Conan uses Ninja as the build system generator, add the following configuration to your Conan profile (`~/.conan/profiles/default` or create a new profile):

```plaintext
[conf]
tools.cmake.cmaketoolchain:generator=Ninja
```

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
    cd tests/HelloWorldTests
    MyTests
    ```

## Code Formatting

Maintaining code consistency is crucial to our project, and to aid in this, we enforce strict formatting guidelines. We have automated the process of checking and applying code formatting rules using `clang-format` through a script.

- **Apply Formatting**:
    We provide a script to format your code automatically according to our project's standards. This ensures that your contributions adhere to our formatting guidelines.

    - For Windows users, run the following command in Command Prompt:
        ```cmd
        .\scripts\format-code.cmd
        ```
        This script formats all C++ source and header files within the `components` directory according to the project's `clang-format` configuration.

    - For Linux/macOS users, please ensure you have `clang-format` installed and run the following command in the terminal:
        ```sh
        find ./components -iname '*.h' -o -iname '*.cpp' -exec clang-format -i {} +
        ```
        This command searches for all `.h` and `.cpp` files within the `components` directory and applies `clang-format` to them.

- **Checking Formatting**:
    Currently, the automated script directly applies formatting. To check formatting without applying changes, Linux/macOS users can use the following command to list files that would be reformatted:
    ```sh
    find ./components -iname '*.h' -o -iname '*.cpp' -exec clang-format -n -Werror {} +
    ```
    For Windows users, incorporating a check functionality into the `format-code.cmd` script requires additional scripting to compare the formatted output to the original files, which can be achieved through custom scripting or third-party tools.

## Static Code Analysis with Clang Static Analyzer

The Clang Static Analyzer is a powerful tool for detecting bugs, memory leaks, and other potential issues in C and C++ code. It analyzes the code at compile time, without needing to execute it.

### Running the Clang Static Analyzer

To run the Clang Static Analyzer on this project, please follow these steps. Note that on Windows, these steps should be performed in Git Bash to ensure compatibility with Unix-like commands and behaviors used by `scan-build`.

#### Open Git Bash

On Windows, start Git Bash. It provides a Unix-like terminal environment that is compatible with many tools developed for Linux or macOS.

#### Prepare Your Build Environment

Navigate to your `build` directory within the Git Bash terminal. Ensure your project is configured with CMake and Conan as detailed in the "Building the Project" section.

#### Run the Analyzer

In your `build` directory, execute the Clang Static Analyzer using `scan-build`:

```sh
scan-build cmake --build .
```

Please ensure to format your code using the provided script before submitting a pull request. This helps to maintain a consistent codebase and simplifies the review process.