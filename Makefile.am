## Process this file with automake to produce Makefile.in
# Copyright (C) 2002, 2003 Simon Josefsson.
#
# This file is part of Libntlm.
#
# Libntlm is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation; either version 2.1 of
# the License, or (at your option) any later version.
#
# Libntlm is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with Libntlm; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA

EXTRA_DIST = libntlm.pc.in

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libntlm.pc

lib_LTLIBRARIES = libntlm.la

include_HEADERS = ntlm.h

libntlm_la_SOURCES = smbdes.c smbencrypt.c smbmd4.c smbutil.c smbdes.h smbmd4.h smbbyteorder.h smbencrypt.h version.c
libntlm_la_LDFLAGS = -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE)

# Maintainer targets

.PHONY: ChangeLog
ChangeLog:
	test ! -f .cvsusers || \
	cvs2cl --FSF --usermap .cvsusers -I \
		"ChangeLog|.cvs|autogen.sh"

indent:
	indent $(SOURCES)

htmldir = ../www-$(PACKAGE)
tag = $(PACKAGE)-`echo $(VERSION) | sed 's/\./-/g'`

release:
	cvs upd -p -r HEAD NEWS > /dev/null
	if cvs upd -p -r $(tag) NEWS > /dev/null; then false else true; fi
	rm -f ChangeLog && cvs upd ChangeLog
	cvs commit
	$(MAKE) distcheck
	cvs commit -m "" ChangeLog
	rm -f $(distdir).tar.gz.asc
	gpg -a --sign --detach $(distdir).tar.gz
	gpg --verify $(distdir).tar.gz.asc
	test -d $(htmldir) && cp -v $(distdir).tar.gz* $(htmldir)/releases/
	test -d $(htmldir) && cp -v $(PACKAGE).{ps,pdf,html} $(htmldir)/
	test -d $(htmldir) && cd $(htmldir) && cvs commit -m "Update." \
		$(PACKAGE).{ps,pdf,html} releases/$(distdir).tar.gz*
	cvs rtag $(tag) $(PACKAGE)
