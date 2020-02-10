TARGET = cubes
#LIBS = -lm
#CC = clang
#CFLAGS = -Wall -O0 -g
CFLAGS = -Wall -O3 -ffast-math -march=native
#LDFLAGS = -static

.PHONY: default all clean
default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@

clean:
	-rm -f $(OBJECTS)
	-rm -f $(TARGET)

%.S: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -S -fasm -o $@
asm: $(TARGET).S
