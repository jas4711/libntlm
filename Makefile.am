## Process this file with automake to produce Makefile.in
# Copyright (C) 2002-2024 Simon Josefsson.
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
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,
# USA

SUBDIRS = lib

ACLOCAL_AMFLAGS = -I m4

EXTRA_DIST = cfg.mk maint.mk
EXTRA_DIST += CONTRIBUTING.md
EXTRA_DIST += libntlm.pc.in test.txt libntlm.spec

EXTRA_DIST += bootstrap.conf bootstrap bootstrap-funclib.sh

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libntlm.pc

noinst_LTLIBRARIES = libntlm_impl.la
lib_LTLIBRARIES = libntlm.la

include_HEADERS = ntlm.h

AM_CFLAGS = $(WARN_CFLAGS)
AM_CPPFLAGS = -I$(srcdir)/lib -I$(builddir)/lib -DNTLM_SRCDIR=\"$(srcdir)\"

libntlm_impl_la_SOURCES = smbutil.c smbencrypt.c
libntlm_la_SOURCES =
libntlm_la_LDFLAGS = -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE) \
	-export-symbols-regex '^(dumpSmb|buildSmb|ntlm_).*' -no-undefined

libntlm_la_LIBADD = libntlm_impl.la lib/libgnu.la

# test

TESTS = test_ntlm test_CVE-2019-17455
check_PROGRAMS = $(TESTS)
LDADD = libntlm_impl.la lib/libgnu.la
CLEANFILES = test.out
test_ntlm_LDFLAGS = -no-install

LOG_COMPILER = $(VALGRIND)

# dist

dist-hook: mtime-NEWS-to-git-HEAD

.PHONY: mtime-NEWS-to-git-HEAD
mtime-NEWS-to-git-HEAD:
	$(AM_V_GEN)if test -e $(srcdir)/.git \
			&& command -v git > /dev/null; then \
		touch -m -d @"$$(git log -1 --format=%ct)" $(srcdir)/NEWS; \
	fi
