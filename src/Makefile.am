bin_PROGRAMS = tecoc
tecoc_CPPFLAGS = @CURSES_CFLAGS@
tecoc_LDADD = @CURSES_LIBS@
tecoc_LDADD += -ltinfo
tecoc_LDFLAGS = -static
tecoc_SOURCES = tecoc.c
tecoc_SOURCES += \
	baksrc.c bldstr.c clenup.c cmatch.c docjr.c doeves.c doflag.c \
	echoit.c err.c exea.c exeats.c exeb.c exebar.c exebsl.c exec.c \
	execcc.c execln.c execom.c execrt.c execst.c execta.c exectc.c \
	exectd.c execte.c execti.c exectl.c exectn.c execto.c exectp.c \
	exectq.c exectr.c exects.c exectt.c exectu.c exectv.c exectw.c \
	exectx.c execty.c exectz.c exed.c exedgt.c exedot.c exedqu.c \
	exee.c exeequ.c exeesc.c exeexc.c exeey.c exef.c exefb.c exeg.c \
	exegtr.c exeh.c exei.c exeill.c exej.c exek.c exel.c exelbr.c \
	exelst.c exem.c exen.c exenul.c exenyi.c exeo.c exeopr.c exep.c \
	exeprc.c exepw.c exeq.c exeqes.c exer.c exerbr.c exertp.c exes.c \
	exescl.c exet.c exeu.c exeund.c exeusc.c exev.c exew.c exex.c \
	exey.c exez.c findes.c findqr.c flowec.c flowee.c flowel.c \
	getara.c getnma.c inccbp.c init.c insstr.c isradx.c ln2chr.c \
	makdbf.c makrom.c popmac.c pshmac.c pushex.c rdline.c rdpage.c \
	readcs.c replac.c search.c singlp.c skpcmd.c srclop.c sserch.c \
	tabort.c typbuf.c typest.c uminus.c wrpage.c zfrsrc.c zunix.c

OBJECTS= $(CFILES:.c=.o)

tecoc-static: $(OBJECTS)
	$(CC) -static -o $@ $(OBJECTS) @CURSES_LIBS@
