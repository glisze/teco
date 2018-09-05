dnl @THIS@

# serial 1

dnl TECO_MODULEDIR([DIRECTORY])
dnl
dnl Substitute tecomoduledir, by default $libdir/teco.
dnl Change with --with-tecomoduledir=somewhere
AC_DEFUN([TECO_MODULEDIR],
[AC_ARG_WITH([tecomoduledir],
  [AS_HELP_STRING([--with-tecomoduledir],
    [Teco modules installation directory @<:@]'${libdir}/teco'[@:>@])],,
    [with_tecomoduledir=]'${libdir}/teco')
AC_SUBST([tecomoduledir], [$with_tecomoduledir])
])dnl TECO_MODULEDIR

dnl TECO_OBJECTDIR([DIRECTORY])
dnl
dnl Substitute tecoobjectdir, by default $datarootdir/teco.
dnl Change with --with-tecoobjectdir=somewhere
AC_DEFUN([TECO_OBJECTDIR],
[AC_ARG_WITH([tecoobjectdir],
  [AS_HELP_STRING([--with-tecoobjectdir],
    [Teco objects installation directory @<:@]'${datarootdir}/teco'[@:>@])],,
    [with_tecoobjectdir=]'${datarootdir}/teco')
AC_SUBST([tecoobjectdir], [$with_tecoobjectdir])
])dnl TECO_OBJECTDIR
