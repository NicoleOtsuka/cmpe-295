CFLAGS = -g -O2 -Wall -lpthread
HEADERS = ipif.h utilis.h
OBJECTS_LIB = ipif.o
OBJECTS_ZERO = test_zero.o ipif.o
OBJECTS_LOOP = test_loop.o ipif.o

default: test_zero test_loop libipif.so

%.o: %.c $(HEADERS)
	$(CC) -fpic -c $< -o $@

test_zero: $(OBJECTS_ZERO)
	$(CC) $(CFLAGS) $(OBJECTS_ZERO) -o $@

test_loop: $(OBJECTS_LOOP)
	$(CC) $(CFLAGS) $(OBJECTS_LOOP) -o $@

libipif.so: $(OBJECTS_LIB)
	$(CC) $(CFLAGS) $(OBJECTS_LIB) -shared -o $@

.PHONY: clean

clean:
	rm -f $(OBJECTS) $(OBJECTS_ZERO) $(OBJECTS_LOOP) test_zero test_loop libipif.so
