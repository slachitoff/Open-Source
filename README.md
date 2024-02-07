# Open-Source Project

This repository serves as a template for C++ projects using a component-based architecture. It demonstrates best practices in organizing code, managing dependencies, and ensuring code quality and testing.

## Component Specification

Our project is structured around components to promote modularity, reusability, and maintainability. Components are logical units of code that provide specific functionality, encapsulated within namespaces and adhering to our project's coding and architectural guidelines.

- **Detailed Component Guidelines**: For comprehensive details on defining and structuring components within this project, refer to our [Component Specification](docs/COMPONENT_SPEC.md).

## Building the Project

This project uses CMake as its build system and Conan for dependency management. To build the project:

1. **Configure the Build**:
    ```sh
    mkdir build && cd build
    conan install .. --build=missing -s build_type=Debug -of .
    cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON 
    ```

2. **Compile the Project**:
    ```sh
    cmake --build .
    ```

3. **Run Tests**:
    ```sh
    cd debug
    MyTests
    ```
## Code Formatting

Before submitting your contribution, please ensure your code adheres to our formatting standards. Run the following script to check for formatting issues:

```powershell
.\scripts\check-formatting.ps1