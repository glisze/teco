AC_INIT([tecoc],
        m4_esyscmd([sh scripts/git-version-gen VERSION \
        --prefix release\\/v ]),
        [not-ready-to-be-bug-free@a.b.c], [tecoc],
        [https://glisze.github.com/teco/])
AM_INIT_AUTOMAKE([foreign])
AC_PROG_CC
AX_WITH_CURSES
AC_CONFIG_HEADERS([src/config.h])
AC_CONFIG_FILES([
  Makefile
  src/Makefile
])
AC_OUTPUT
