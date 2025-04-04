#
## EPITECH PROJECT, 2024
## B-DOP-200-LIL-2-1-chocolatine-jules.vanden-bosch
## File description:
## Makefile
##

CC = gcc
CFLAGS = -Wall -Wextra -I include
LDFLAGS = -lcriterion
SRC = src/main.c src/print.c
OBJ = src/main.o src/print.o
NAME = binary
TEST_SRC = tests/tests.c
TEST_OBJ = tests/tests.o
TEST_BIN = unit_tests

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME)

src/main.o: src/main.c
	$(CC) $(CFLAGS) -c src/main.c -o src/main.o

src/print.o: src/print.c
	$(CC) $(CFLAGS) -c src/print.c -o src/print.o

tests_run: $(TEST_BIN)
	./$(TEST_BIN)

$(TEST_BIN): $(TEST_OBJ) $(OBJ)
	$(CC) $(TEST_OBJ) $(OBJ) -o $(TEST_BIN) $(LDFLAGS)

tests/tests.o: tests/tests.c
	$(CC) $(CFLAGS) -c tests/tests.c -o tests/tests.o

clean:
	rm -f $(OBJ) $(TEST_OBJ)

fclean: clean
	rm -f $(NAME) $(TEST_BIN)

re: fclean all

.PHONY: all clean fclean re tests_run
