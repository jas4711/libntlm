dnl Process this file with autoconf to produce a configure script.
AC_INIT(libntlm, 0.3.0, bug-libntlm@josefsson.org)
AC_CONFIG_SRCDIR(ntlm.h.in)

# Interfaces removed:    CURRENT++, AGE=0, REVISION=0
# Interfaces added:      CURRENT++, AGE++, REVISION=0
# No interfaces changed:                   REVISION++
LT_CURRENT=0
LT_REVISION=0
LT_AGE=0
AC_SUBST(LT_CURRENT)
AC_SUBST(LT_REVISION)
AC_SUBST(LT_AGE)

AM_INIT_AUTOMAKE($PACKAGE_NAME, $PACKAGE_VERSION)
AM_CONFIG_HEADER(config.h)

# Checks for programs.
AC_PROG_LIBTOOL
AC_PROG_CXX
AC_PROG_CC
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_RANLIB
AC_PROG_AWK

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([stdlib.h string.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_SIZE_T

# Checks for library functions.
AC_CHECK_FUNCS([memset strchr strdup])

LIBNTLM_LIBS="$LIBS -L${libdir} -lntlm"
LIBNTLM_CFLAGS="$CPPFLAGS -I${includedir}"
AC_SUBST(LIBNTLM_LIBS)
AC_SUBST(LIBNTLM_CFLAGS)

AC_CONFIG_COMMANDS([chmod],[[chmod +x libntlm-config]])

AC_CONFIG_FILES([Makefile libntlm-config ntlm.h])

AC_OUTPUT
