CC=gcc
CFLAGS=-O2
OUT=a.exe

rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard ,$d, $2) $(filter $(subst *, %, $2),$d))
SRC=$(call rwildcard, ./, *.c)

.PHONEY: all
all: build run

build:
	@ $(CC) $(SRC) -o $(OUT)

run:
	@ ./$(OUT)

