# Compiler
CC = gcc

# Directories
SRC_DIR = src
OBJ_DIR = obj

# Executable
TARGET = cmail

# Source files
SOURCES = $(wildcard $(SRC_DIR)/*.c)

# Object files
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SOURCES))

# Compiler flags
CFLAGS = -Wall -Wextra -O2

# Linker flags
LDFLAGS = 

# Rule to create the object directory
$(OBJ_DIR):
	mkdir $(OBJ_DIR)

# Rule to compile the executable
$(TARGET): $(OBJ_DIR) $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $(TARGET)

# Rule to compile the object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(TARGET)

# Rule to clean the build files
.PHONY: clean
clean:
	rm -rf $(OBJ_DIR) $(TARGET)
