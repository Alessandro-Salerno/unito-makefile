CC=gcc
CFLAGS=-O2
OUT=a.exe

rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard ,$d, $2) $(filter $(subst *, %, $2),$d))
SRC=$(call rwildcard, ./, *.c)

$(OUT):
	@ echo Compilazione eseguibile
	@ $(CC) $(SRC) -o $(OUT)

run:
	@ ./$(OUT)

