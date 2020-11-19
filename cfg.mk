# Copyright (C) 2006-2020 Simon Josefsson.
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

local-checks-to-skip = sc_GPL_version sc_bindtextdomain
VC_LIST_ALWAYS_EXCLUDE_REGEX = ^(examples|lib)/.*$$

exclude_file_name_regexp--sc_trailing_blank = ^test.txt$$

W32ROOT ?= $(HOME)/w32root

mingw32: autoreconf
	./configure --host=i586-mingw32msvc --build=`./config.guess` --prefix=$(W32ROOT)

INDENT_SOURCES = $(SOURCES)

# Maintainer targets

ChangeLog:
	git2cl > ChangeLog
	cat .clcopying >> ChangeLog

htmldir = ../www-$(PACKAGE)
tag = $(PACKAGE)-`echo $(VERSION) | sed 's/\./-/g'`

release: prepare ship

prepare:
	! git tag -l $(tag) | grep $(PACKAGE) > /dev/null
	rm -f ChangeLog
	$(MAKE) ChangeLog distcheck
	gpg -b $(distdir).tar.gz
	gpg --verify $(distdir).tar.gz.sig
	git commit -m Generated. ChangeLog
	git tag -m $(VERSION) $(tag)

ship:
	git push
	git push --tags
	cp $(distdir).tar.gz $(distdir).tar.gz.sig ../releases/$(PACKAGE)/
	cp -v $(distdir).tar.gz $(distdir).tar.gz.sig $(htmldir)/releases/
	cd $(htmldir) && \
		cvs add -kb releases/$(distdir).tar.gz \
			releases/$(distdir).tar.gz.sig && \
		cvs commit -m "Update." releases/

review-diff:
	git diff `git describe --abbrev=0`.. \
	| grep -v -e ^index -e '^diff --git' \
	| filterdiff -p 1 -x 'build-aux/*' -x 'gl/*' -x 'maint.mk' -x '.gitignore' -x '.x-sc*' -x ChangeLog -x GNUmakefile \
	| less
