# Copyright (C) 2004 Free Software Foundation, Inc.
# This file is free software, distributed under the terms of the GNU
# General Public License.  As a special exception to the GNU General
# Public License, this file may be distributed as part of a program
# that contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# Generated by gnulib-tool.
#
# This file represents the compiled summary of the specification in
# gnulib-cache.m4. It lists the computed macro invocations that need
# to be invoked from configure.ac.
# In projects using CVS, this file can be treated like other built files.


# This macro should be invoked from ./configure.ac, in the section
# "Checks for programs", right after AC_PROG_CC, and certainly before
# any checks for libraries, header files, types and library functions.
AC_DEFUN([gl_EARLY],
[
  AC_REQUIRE([AC_GNU_SOURCE])
])

# This macro should be invoked from ./configure.ac, in the section
# "Check for header files, types and library functions".
AC_DEFUN([gl_INIT],
[
  gl_CHECK_VERSION
  gl_DES
  gl_MD4
  AM_STDBOOL_H
  gl_STDINT_H
  gl_FUNC_STRDUP
  gl_FUNC_STRVERSCMP
])

# This macro records the list of files which have been installed by
# gnulib-tool and may be removed by future gnulib-tool invocations.
AC_DEFUN([gl_FILE_LIST], [
  lib/check-version.c
  lib/check-version.h
  lib/des.c
  lib/des.h
  lib/md4.c
  lib/md4.h
  lib/stdbool_.h
  lib/stdint_.h
  lib/strdup.c
  lib/strdup.h
  lib/strverscmp.c
  lib/strverscmp.h
  m4/check-version.m4
  m4/des.m4
  m4/inttypes.m4
  m4/md4.m4
  m4/onceonly_2_57.m4
  m4/stdbool.m4
  m4/stdint.m4
  m4/strdup.m4
  m4/strverscmp.m4
])
