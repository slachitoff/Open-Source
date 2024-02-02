## Component Structure

Each component should adhere to the following structure within the `components` directory of the project:

- **Namespace**: All entities (classes, functions, constants) belonging to the component must be defined within a specific namespace named after the component.

- **Directory Structure**: 
  - The component's header and implementation files should reside in a subdirectory within the `components` directory. This subdirectory should match the component's name.
  - For example, components named `MyComponent` should be placed in `components/MyComponent/`.

- **Header Files**: 
  - Header files should be named after the classes or functionalities they declare and placed within the component's directory.
  - For example, `components/MyComponent/Feature.h`.

- **Implementation Files**: 
  - Implementation (`.cpp`) files should correspond to their header files and be named similarly, placed within the same component directory.
  - For example, `components/MyComponent/Feature.cpp`.

## Guidelines

1. **Naming Conventions**:
   - Namespaces: Use lowercase with words separated by underscores (e.g., `my_component`).
   - Classes/Structs: Use PascalCase (e.g., `MyClass`).
   - Functions/Variables: Use camelCase (e.g., `myFunction`, `myVariable`).

2. **Documentation**:
   - Every component (namespace) should have a leading comment block describing its purpose and main functionalities.
   - Public interfaces (classes, functions) must be documented in their header files, summarizing their behavior, parameters, and return values.

3. **Consistency**:
   - Ensure consistency in naming and structure within and across components to maintain readability and ease of navigation.

4. **Isolation**:
   - Components should be designed to minimize dependencies on other components. Use forward declarations and interfaces to reduce coupling where possible.

5. **Testing**:
   - Each component must have corresponding unit tests located in a `tests` subdirectory within the component's directory. This `tests` subdirectory should adhere to the same naming convention as its component directory.

## Example

```cpp
// File: components/ComponentName/Feature.h

namespace component_name {
    /**
     * Brief description of the class.
     */
    class MyClass {
    public:
        /**
         * Brief description of the method.
         * @param param Description of the parameter.
         * @return Description of the return value.
         */
        int myMethod(int param);
    };
}
