CFLAGS=-Wall -O2

DEST=/usr/local
LIBDEST=$(DEST)/lib
INCDEST=$(DEST)/include

SRCS=smbdes.c smbencrypt.c smbmd4.c smbutil.c
OBJS=smbdes.o smbencrypt.o smbmd4.o smbutil.o

libntlm.a: $(OBJS)
	ar cru libntlm.a $(OBJS)
	ranlib libntlm.a

install: libntlm.a ntlm.h
	install libntlm.a $(LIBDEST)
	install ntlm.h $(INCDEST)

clean: 
	rm -f *.a *.o *~ *.bak \#*\#

depend:
	makedepend $(SRCS)
	
# DO NOT DELETE

smbdes.o: smbdes.h
smbencrypt.o: /usr/include/unistd.h /usr/include/features.h
smbencrypt.o: /usr/include/sys/cdefs.h /usr/include/gnu/stubs.h
smbencrypt.o: /usr/include/bits/posix_opt.h /usr/include/bits/types.h
smbencrypt.o: /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/include/stddef.h
smbencrypt.o: /usr/include/bits/confname.h /usr/include/getopt.h
smbencrypt.o: /usr/include/stdlib.h /usr/include/sys/types.h
smbencrypt.o: /usr/include/time.h /usr/include/endian.h
smbencrypt.o: /usr/include/bits/endian.h /usr/include/sys/select.h
smbencrypt.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
smbencrypt.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
smbencrypt.o: /usr/include/string.h /usr/include/ctype.h smbbyteorder.h
smbencrypt.o: smbdes.h smbmd4.h
smbmd4.o: smbmd4.h
smbutil.o: /usr/include/unistd.h /usr/include/features.h
smbutil.o: /usr/include/sys/cdefs.h /usr/include/gnu/stubs.h
smbutil.o: /usr/include/bits/posix_opt.h /usr/include/bits/types.h
smbutil.o: /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/include/stddef.h
smbutil.o: /usr/include/bits/confname.h /usr/include/getopt.h
smbutil.o: /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h
smbutil.o: /usr/include/endian.h /usr/include/bits/endian.h
smbutil.o: /usr/include/sys/select.h /usr/include/bits/select.h
smbutil.o: /usr/include/bits/sigset.h /usr/include/sys/sysmacros.h
smbutil.o: /usr/include/alloca.h /usr/include/stdio.h
smbutil.o: /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/include/stdarg.h
smbutil.o: /usr/include/libio.h /usr/include/_G_config.h
smbutil.o: /usr/include/bits/stdio_lim.h /usr/include/ctype.h
smbutil.o: /usr/include/assert.h ntlm.h smbencrypt.h smbbyteorder.h
