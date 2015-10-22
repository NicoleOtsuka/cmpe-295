CC = /home/nicolin/download/cmpe295/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
CFLAGS = -g -O2 -Wall -lpthread
HEADERS = ipif.h utilis.h
OBJECTS_ZERO = test_zero.o ipif.o
OBJECTS_LOOP = test_loop.o ipif.o

default: test_zero test_loop

%.o: %.c $(HEADERS)
	$(CC) -c $< -o $@

test_zero: $(OBJECTS_ZERO)
	$(CC) $(CFLAGS) $(OBJECTS_ZERO) -o $@

test_loop: $(OBJECTS_LOOP)
	$(CC) $(CFLAGS) $(OBJECTS_LOOP) -o $@

.PHONY: clean

clean:
	rm -f $(OBJECTS) test
