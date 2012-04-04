# Compilation parameters.
CC     = gcc
CFLAGS = -Wall -O3
LIBS   = -lm

# Installation parameters.
EXE    = svd
PREFIX = /usr/local

# Default rule is to build the executable.
all: $(EXE)

# Link the objects together to an executable file.
$(EXE): main.o libsvd.a
	$(CC) $(CFLAGS) -o $@ main.o libsvd.a $(LIBS)
	@echo "Build was successful. Now type \`make install'."

# Create an object archive (will be statically linked).
libsvd.a: svdlib.o svdutil.o las2.o
	@rm -f $@
	ar cr $@ $^
	ranlib $@

# Pattern rule to compile all the C files.
%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: clean
clean: 
	rm -rf *.o svd libsvd.a
	@echo "Directory cleaned."

.PHONY: install
install: $(EXE)
	install -m 755 $(EXE) $(PREFIX)/bin
	@echo "Successfully installed under $(PREFIX)/bin"
