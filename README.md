This project uses CMake as its build system and Conan for dependency management, with Ninja as the preferred build system generator for its efficiency and speed. Follow these steps to build the project:

1. **Install Dependencies**:
    Ensure you have CMake, Conan, and Ninja installed on your system. Ninja can be installed from its [GitHub releases page](https://github.com/ninja-build/ninja/releases) and should be added to your system's PATH.

2. **Configure the Build**:
    Create a build directory, and use Conan to install dependencies. Then configure the project with CMake using Ninja as the generator.
    ```sh
    mkdir build && cd build
    conan install .. --build=missing -s build_type=Debug
    cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
    ```

3. **Compile the Project**:
    Compile the project with Ninja.
    ```sh
    ninja
    ```

4. **Run Clang-Tidy**:
    Perform static code analysis with Clang-Tidy to ensure code quality. Make sure `compile_commands.json` is generated in your build directory.
    ```sh
    clang-tidy ../src/main.cpp
    ```

5. **Run Tests**:
    Execute the test suite to verify the correctness of your code. Assuming tests are compiled into an executable named `MyTests`.
    ```sh
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