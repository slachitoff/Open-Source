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
    conan install .. --build=missing -s build_type=Release
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake
    ```

2. **Compile the Project**:
    ```sh
    cmake --build .
    ```

3. **Run Tests**:
    ```sh
    ctest
    ```