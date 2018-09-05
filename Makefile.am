SUBDIRS = src
dist_doc_DATA = README.md LICENSE

ACLOCAL_AMFLAGS = -I m4
EXTRA_DIST = m4/ax_with_curses.m4
EXTRA_DIST += m4/pkg.m4
EXTRA_DIST += m4/ax_require_defined.m4
EXTRA_DIST += m4/teco.m4
EXTRA_DIST += \
	src/chmacs.h \
	src/clpars.h \
	src/config.h \
	src/dchars.h \
	src/deferr.h \
	src/defext.h \
	src/dscren.h \
	src/tecoc.h \
	src/vrbmsg.h \
	src/zport.h

modulesdir = @tecomoduledir@
dist_modules_DATA = \
   src/change.tes \
   src/clpars.tes \
   src/date.tes \
   src/detab.tes \
   src/dir.tes \
   src/fmtmac.tes \
   src/format.tes \
   src/makprnt.tes \
   src/search.tes \
   src/squ.tes \
   src/tecoin.tes \
   src/teco.tes \
   src/type.tes \
   src/unsqu.tes \
   src/vtedit.tes
