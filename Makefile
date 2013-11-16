# Makefile for ncping
# Oct 18, 2013
# root@davejingtian.org
# http://davejingtian.org
# NOTE: part of the Makefile is ported
# from the original Makefile for iputils~

# Path to parent kernel include files directory
LIBC_INCLUDE=/usr/include

DEFINES=

#options if you have a bind>=4.9.4 libresolv (or, maybe, glibc)
LDLIBS=
ADDLIB=

#options if you compile with libc5, and without a bind>=4.9.4 libresolv
# NOT AVAILABLE. Please, use libresolv.

CC=gcc
# What a pity, all new gccs are buggy and -Werror does not work. Sigh.
#CCOPT=-D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall -g -Werror
CCOPT=-D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall -g
CFLAGS=$(CCOPT) $(GLIBCFIX) $(DEFINES)

ncping: ping.o ping_common.o
	$(CC) -o ncping ping.o ping_common.o

ping.o: ping.c
	$(CC) $(CFLAGS) -c -o ping.o ping.c

ping_common.o: ping_common.c
	$(CC) $(CFLAGS) -c -o ping_common.o ping_common.c

clean:
	rm -rf *.o
	rm -rf ncping
