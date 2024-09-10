cmake_minimum_required(VERSION 3.10)

# Nombre del proyecto
project(MyCProject)

# Establecer el estándar de C
set(CMAKE_C_STANDARD 99)

# Incluir directorio de headers
include_directories(include)

# Agregar el ejecutable
add_executable(MyCProject src/main.c)
