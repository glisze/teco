$ ccc	:== @zvccc
$ dccc	:== @dccc
$ lt	:== LINK/NOTRACBACK tecoc,tecoc/LIBRARY,tecoc/OPTIONS
$ lpca	:== LINK/DEBUG=sys$library:pca$obj.obj tecoc,tecoc/LIBR,tecoc/OPT
$ ld	:== LINK/DEBUG tecoc,tecoc/LIBRARY,tecoc/OPTIONS
$ tecoc	:== $sys$login_device:[siemsen.teco.tecoc]tecoc teco/nocreate
$ tcmun	:== $sys$login_device:[siemsen.teco.tecoc]tecoc mung
$ DEFINE/NOLOG tec$macros sys$login_device:[siemsen.teco.macros]
$ DEFINE/NOLOG tec$init $tec$macros:teco.ini
$ DEFINE/NOLOG tec$help sys$login_device:[siemsen.teco.tecoc]tecoc.hlb
$ DEFINE/NOLOG lnk$library sys$library:vaxcrtl
