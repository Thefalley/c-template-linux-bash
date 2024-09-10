#!/bin/bash

# Nombre del proyecto
PROJECT_NAME="MyCProject"

# Crear las carpetas src e include
mkdir -p $PROJECT_NAME/src $PROJECT_NAME/include

# Crear el archivo principal en src/main.c
cat <<EOL > $PROJECT_NAME/src/main.c
#include <stdio.h>
#include "main.h"

int main() {
    hello();
    return 0;
}
EOL

# Crear un archivo de cabecera en include/main.h
cat <<EOL > $PROJECT_NAME/include/main.h
#ifndef MAIN_H
#define MAIN_H

void hello();

#endif
EOL

# Crear una implementación para la función hello en src/hello.c
cat <<EOL > $PROJECT_NAME/src/hello.c
#include <stdio.h>
#include "main.h"

void hello() {
    printf("Hello, World!\\n");
}
EOL

# Crear el archivo Makefile
cat <<EOL > $PROJECT_NAME/Makefile
# Nombre del ejecutable
TARGET = my_program

# Directorios
SRC_DIR = src
INCLUDE_DIR = include

# Archivos fuente (todos los .c en el directorio src)
SRCS = \$(wildcard \$(SRC_DIR)/*.c)

# Archivos objeto generados a partir de los archivos fuente
OBJS = \$(SRCS:.c=.o)

# Compilador y banderas
CC = gcc
CFLAGS = -I\$(INCLUDE_DIR) -Wall -Wextra -std=c99

# Regla predeterminada: compilar el ejecutable
all: \$(TARGET)

# Regla para compilar el ejecutable a partir de los archivos objeto
\$(TARGET): \$(OBJS)
	\$(CC) \$(OBJS) -o \$(TARGET)

# Regla para compilar archivos .c a archivos .o
%.o: %.c
	\$(CC) \$(CFLAGS) -c \$< -o \$@

# Limpia los archivos generados
clean:
	rm -f \$(TARGET) \$(SRC_DIR)/*.o
EOL

# Mensaje de confirmación
echo "Proyecto $PROJECT_NAME creado con las carpetas 'src' y 'include', y el archivo Makefile."
 

## Compilar codigo 
cd MyCProject
make 

./my_program
