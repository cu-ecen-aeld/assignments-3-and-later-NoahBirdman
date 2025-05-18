#Makefile for writer.c
#Author: Noah Bergman

CROSS_COMPILE?=
ifeq ($(CROSS_COMPILE), "")
	CC = gcc
else
	CC = $(CROSS_COMPILE)gcc
endif

writer: writer.o
	$(CC) -o  writer writer.o

writer.o: writer.c
	$(CC) -c -Wall -g writer.c

#make clean
clean: 
	rm -f writer writer.o
