## Process this file with automake to produce Makefile.in
#    Copyright (C) 2002 Simon Josefsson
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This file is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

EXTRA_DIST = libntlm-config.in libntlm.m4

bin_SCRIPTS = libntlm-config

m4datadir = $(datadir)/aclocal
m4data_DATA = libntlm.m4

lib_LTLIBRARIES = libntlm.la

include_HEADERS = ntlm.h

libntlm_la_SOURCES = smbdes.c smbencrypt.c smbmd4.c smbutil.c smbdes.h smbmd4.h smbbyteorder.h smbencrypt.h version.c
libntlm_la_LDFLAGS = -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE)
