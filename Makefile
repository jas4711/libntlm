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
smbencrypt.o: /usr/include/posix_opt.h /usr/include/gnu/types.h
smbencrypt.o: /usr/lib/gcc-lib/i386-redhat-linux/2.7.2.3/include/stddef.h
smbencrypt.o: /usr/include/confname.h /usr/include/stdlib.h
smbencrypt.o: /usr/include/sys/types.h /usr/include/time.h
smbencrypt.o: /usr/include/endian.h /usr/include/bytesex.h
smbencrypt.o: /usr/include/sys/select.h /usr/include/selectbits.h
smbencrypt.o: /usr/include/alloca.h /usr/include/string.h
smbencrypt.o: /usr/include/ctype.h smbbyteorder.h smbdes.h smbmd4.h
smbmd4.o: smbmd4.h
smbutil.o: /usr/include/unistd.h /usr/include/features.h
smbutil.o: /usr/include/sys/cdefs.h /usr/include/gnu/stubs.h
smbutil.o: /usr/include/posix_opt.h /usr/include/gnu/types.h
smbutil.o: /usr/lib/gcc-lib/i386-redhat-linux/2.7.2.3/include/stddef.h
smbutil.o: /usr/include/confname.h /usr/include/stdlib.h
smbutil.o: /usr/include/sys/types.h /usr/include/time.h /usr/include/endian.h
smbutil.o: /usr/include/bytesex.h /usr/include/sys/select.h
smbutil.o: /usr/include/selectbits.h /usr/include/alloca.h
smbutil.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
smbutil.o: /usr/lib/gcc-lib/i386-redhat-linux/2.7.2.3/include/stdarg.h
smbutil.o: /usr/include/stdio_lim.h /usr/include/ctype.h
smbutil.o: /usr/include/assert.h ntlm.h smbencrypt.h smbbyteorder.h
