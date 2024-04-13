# Copyright (C) 2006-2024 Simon Josefsson.
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

TAR_OPTIONS += --mode=go+u,go-w --mtime=$(srcdir)/NEWS

update-copyright-env = \
	UPDATE_COPYRIGHT_HOLDER="Simon Josefsson"	\
	UPDATE_COPYRIGHT_USE_INTERVALS=2		\
	UPDATE_COPYRIGHT_FORCE=1

local-checks-to-skip = \
	sc_GPL_version		\
	sc_bindtextdomain	\
	sc_immutable_NEWS	\
	sc_prohibit_strcmp

VC_LIST_ALWAYS_EXCLUDE_REGEX = ^(examples|lib)/.*$$

exclude_file_name_regexp--sc_trailing_blank = ^test.txt$$

INDENT_SOURCES = $(SOURCES)

# maint.mk's public-submodule-commit breaks on shallow gnulib
# https://lists.gnu.org/archive/html/bug-gnulib/2022-08/msg00040.html
# so let's disable it - XXX FIXME let's revisit this later
submodule-checks =
gl_public_submodule_commit =

# Maintainer targets

srcdist:
	git archive --prefix=libntlm-v1.8/ -o libntlm-1.8-src.tar.gz HEAD

release: prepare ship

prepare:
	! git tag -v v$(VERSION) 2>&1 | grep $(PACKAGE) > /dev/null
	$(MAKE) distcheck srcdist
	make -f libntlm4win.mk libntlm4win VERSION=$(VERSION)
	gpg -b $(distdir).tar.gz
	gpg -b $(distdir)-src.tar.gz
	gpg -b $(distdir)-win32.zip
	gpg -b $(distdir)-win64.zip
	gpg --verify $(distdir).tar.gz.sig
	gpg --verify $(distdir)-src.tar.gz.sig
	gpg --verify $(distdir)-win32.zip.sig
	gpg --verify $(distdir)-win64.zip.sig

ship:
	git tag -m "$(PACKAGE) $(VERSION)" v$(VERSION)
	cp -v $(distdir)*.tar.gz* $(distdir)-win??.zip* ../releases/$(PACKAGE)/
	git push
	git push --tags
	scp $(distdir)*.tar.gz* $(distdir)-win??.zip* jas@dl.sv.nongnu.org:/releases/libntlm/

review-diff:
	git diff `git describe --abbrev=0`.. \
	| grep -v -e ^index -e '^diff --git' \
	| filterdiff -p 1 -x 'build-aux/*' -x 'gl/*' -x 'maint.mk' -x '.gitignore' -x '.x-sc*' -x GNUmakefile \
	| less
