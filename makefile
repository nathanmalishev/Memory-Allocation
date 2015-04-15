# 
# Sample Makefile for project 1 (COMP30023)
#
# This example is very basic
#
# The program used for illustration purposes is
# a simple program using prime numbers
#


## CC  = Compiler.
## CFLAGS = Compiler flags.
CC	= gcc
CFLAGS 	= -Wall -g


## OBJ = Object files.
## SRC = Source files.
## EXE = Executable name.

SRC =		memswap.c queue.c first.c best.c worst.c next.c mem_node.c utilities.c
OBJ =		memswap.o queue.o first.o best.o worst.o next.o mem_node.o utilities.o
EXE = 		memswap

## Top level target is executable.
$(EXE):	$(OBJ)
		$(CC) $(CFLAGS) -o $(EXE) $(OBJ) -lm


## Clean: Remove object files and core dump files.
clean:
		/bin/rm $(OBJ) 

## Clobber: Performs Clean and removes executable file.

clobber: clean
		/bin/rm $(EXE) 

## Dependencies

memswap.o:	mem_node.h utilities.h queue.h
queue.o:	queue.h mem_node.h algorithms.h
first.o:	algorithms.h mem_node.h
best.o: 	algorithms.h mem_node.h
worst.o:	algorithms.h mem_node.h
next.o:		algorithms.h mem_node.h
mem_node.o: mem_node.h utilities.h