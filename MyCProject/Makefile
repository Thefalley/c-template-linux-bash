# Nombre del ejecutable
TARGET = my_program

# Directorios
SRC_DIR = src
INCLUDE_DIR = include

# Archivos fuente (todos los .c en el directorio src)
SRCS = $(wildcard $(SRC_DIR)/*.c)

# Archivos objeto generados a partir de los archivos fuente
OBJS = $(SRCS:.c=.o)

# Compilador y banderas
CC = gcc
CFLAGS = -I$(INCLUDE_DIR) -Wall -Wextra -std=c99

# Regla predeterminada: compilar el ejecutable
all: $(TARGET)

# Regla para compilar el ejecutable a partir de los archivos objeto
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

# Regla para compilar archivos .c a archivos .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Limpia los archivos generados
clean:
	rm -f $(TARGET) $(SRC_DIR)/*.o
