# Copyright (C) 2011-2019 Simon Josefsson
#
# This file is part of Libntlm.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

SHELL=bash

PACKAGE = libntlm
distdir = $(PACKAGE)-$(VERSION)
TGZ = $(distdir).tar.gz
URL = http://www.nongnu.org/$(PACKAGE)/releases/$(TGZ)

all:
	@echo 'Usage examples:'
	@echo '  make -f libntlm4win.mk libntlm4win VERSION=1.21'
	@echo '  make -f libntlm4win.mk libntlm4win32 VERSION=1.21 CHECK=check'

libntlm4win: libntlm4win32 libntlm4win64

libntlm4win32:
	$(MAKE) -f libntlm4win.mk doit ARCH=32 HOST=i686-w64-mingw32

libntlm4win64:
	$(MAKE) -f libntlm4win.mk doit ARCH=64 HOST=x86_64-w64-mingw32

doit:
	rm -rf tmp && mkdir tmp && cd tmp && \
	cp ../$(TGZ) . || wget $(URL) && \
	tar xfa $(TGZ) && \
	cd $(distdir) && \
	./configure --host=$(HOST) --build=x86_64-unknown-linux-gnu --prefix=$(PWD)/tmp/root CPPFLAGS=-I$(PWD)/tmp/root/include && \
	make all $(CHECK) install && \
	cd .. && \
	cd root && \
	zip -r ../../$(distdir)-win$(ARCH).zip *

htmldir = ../www-$(PACKAGE)
upload:
	gpg -b $(distdir)-win32.zip
	gpg --verify $(distdir)-win32.zip.sig
	gpg -b $(distdir)-win64.zip
	gpg --verify $(distdir)-win64.zip.sig
	cp -v $(distdir)-win*.zip* $(htmldir)/releases/
	cp -v $(distdir)-win*.zip* ../releases/$(PACKAGE)/
	cd $(htmldir) && \
		cvs add -kb releases/$(distdir)-win*.zip* && \
		cvs commit -m "Update." releases/
