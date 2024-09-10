#!/bin/bash

# Nombre del proyecto
PROJECT_NAME="MyCProject"

# Crear las carpetas src e include
mkdir -p $PROJECT_NAME/src $PROJECT_NAME/include

# Crear el archivo principal en src/main.c
cat <<EOL > $PROJECT_NAME/src/main.c
#include <stdio.h>

int main() {
    printf("Hello, World!\\n");
    return 0;
}
EOL

# Crear el archivo CMakeLists.txt
cat <<EOL > $PROJECT_NAME/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)

# Nombre del proyecto
project($PROJECT_NAME)

# Establecer el estándar de C
set(CMAKE_C_STANDARD 99)

# Incluir directorio de headers
include_directories(include)

# Agregar el ejecutable
add_executable($PROJECT_NAME src/main.c)
EOL

# Mensaje de confirmación
echo "Proyecto $PROJECT_NAME creado con las carpetas 'src' y 'include', y el archivo CMakeLists.txt."
