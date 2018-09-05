dnl @THIS@

# serial 1

dnl TECO_MODULEDIR([DIRECTORY])
dnl
dnl Substitute tecomoduledir, by default $libdir/teco.
dnl Change with --with-tecomoduledir=somewhere
AC_DEFUN([TECO_MODULEDIR],
[AC_ARG_WITH([tecomoduledir],
  [AS_HELP_STRING([--with-tecomoduledir],
    [Teco module installation directory @<:@]'${libdir}/teco'[@:>@])],,
    [with_tecomoduledir=]'${libdir}/teco')
AC_SUBST([tecomoduledir], [$with_tecomoduledir])
])dnl TECO_MODULEDIR
