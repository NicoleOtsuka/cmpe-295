CC = /home/nicolin/download/cmpe295/buildroot-2015.08/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
CFLAGS = -g -O2 -Wall -lpthread
HEADERS = ipif.h utilis.h
OBJECTS = test.o ipif.o

default: test

%.o: %.c $(HEADERS)
	$(CC) -c $< -o $@

test: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@

.PHONY: clean

clean:
	rm -f $(OBJECTS) test
