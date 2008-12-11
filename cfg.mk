# Copyright (C) 2006, 2007, 2008 Simon Josefsson.
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

CFGFLAGS ?= WARN_CFLAGS=-Werror

ifeq ($(.DEFAULT_GOAL),abort-due-to-no-makefile)
.DEFAULT_GOAL := bootstrap
endif

autoreconf:
	test -f ./configure || autoreconf --install

bootstrap: autoreconf
	./configure $(CFGFLAGS)

W32ROOT ?= $(HOME)/w32root

mingw32: autoreconf 
	./configure --host=i586-mingw32msvc --build=`./config.guess` --prefix=$(W32ROOT)

INDENT_SOURCES = $(SOURCES)
