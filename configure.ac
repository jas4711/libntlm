dnl Process this file with autoconf to produce a configure script.

dnl Copyright (C) 2002-2023 Simon Josefsson.
dnl
dnl This file is part of Libntlm.
dnl
dnl Libntlm is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU Lesser General Public License as
dnl published by the Free Software Foundation; either version 2.1 of
dnl the License, or (at your option) any later version.
dnl
dnl Libntlm is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public
dnl License along with Libntlm; if not, write to the Free Software
dnl Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
dnl 02110-1301, USA

AC_INIT([libntlm], [1.7], [libntlm@nongnu.org])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])

# Interfaces removed:    CURRENT++, AGE=0, REVISION=0
# Interfaces added:      CURRENT++, AGE++, REVISION=0
# No interfaces changed:                   REVISION++
AC_SUBST(LT_CURRENT, 0)
AC_SUBST(LT_AGE, 0)
AC_SUBST(LT_REVISION, 22)

AM_INIT_AUTOMAKE([1.10 gnits -Wall])
AC_CONFIG_HEADERS(config.h)
AC_CONFIG_SRCDIR(ntlm.h.in)

# Checks for programs.
AC_PROG_CC
gl_EARLY
AM_PROG_AR
LT_INIT([win32-dll])

AC_C_BIGENDIAN

# For gnulib.
gl_INIT
AC_DEFINE([check_version], ntlm_check_version, [Rename to public API name.])

AC_ARG_ENABLE([gcc-warnings],
  [AS_HELP_STRING([[--enable-gcc-warnings[=TYPE]]],
    [control generation of GCC warnings.  The TYPE 'no' disables
     warnings; 'yes' (default) generates cheap warnings.])])

AS_IF([test "$enable_gcc_warnings" != no], [
   # Set up the list of unwanted warning options.
   nw=
   nw="$nw -fanalyzer"
   nw="$nw -Wsystem-headers"    # Don't warn in system headers.

   # Setup the list of meaningful warning options for the C compiler.
   # The list comes from manywarnings.m4. Warning options that are not
   # generally meaningful have already been filtered out (cf.
   # build-aux/gcc-warning.spec).
   gl_MANYWARN_ALL_GCC([possible_warning_options])

   # Compute the list of warning options that are desired.
   gl_MANYWARN_COMPLEMENT([desired_warning_options],
                          [$possible_warning_options], [$nw])
   # Compute the list of remaining undesired warning options.
   # Namely those, that were not in manywarnings.m4 because they were
   # already listed in build-aux/gcc-warning.spec; this includes those
   # that are implied by -Wall.
   gl_MANYWARN_COMPLEMENT([remaining_undesired_warning_options],
                          [$nw], [$possible_warning_options])

   # Add the desired warning options to WARN_CFLAGS.
   for w in $desired_warning_options; do
     gl_WARN_ADD([$w])
   done

   # Add the opposites of the remaining undesired warning options to
   # WARN_CFLAGS.
   for w in `echo "$remaining_undesired_warning_options" | sed -e 's/-W/-Wno-/g'`; do
     gl_WARN_ADD([$w])
   done
  gl_WARN_ADD([-Wno-pointer-sign])     # Too many warnings for now
  gl_WARN_ADD([-fdiagnostics-show-option])
])

AC_CONFIG_FILES([
  Makefile
  lib/Makefile
  libntlm.pc
  libntlm.spec
  ntlm.h
])
AC_OUTPUT
