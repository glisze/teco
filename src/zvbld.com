$!
$!	This command procedure compiles the TECO-C code.  It works under
$!  VMS v5.2 using VAX C v3.0.  It creates a VMS object module library
$!  named TECOC.OLB.
$!
$ SET DEFAULT sys$login_device:[siemsen.teco.tecoc]
$
$! cflags := /NOLIST/NOOPTIMIZE/DEBUG
$! cflags := /NOLIST/NOOPTIMIZE/DEBUG/DEFINE=(DEBUGGING=TRUE)
$ cflags := /NOLIST
$ IF f$search("tecoc.obj") .NES. "" THEN DELETE tecoc.obj;*
$ CC'cflags' tecoc
$
$ IF f$search("tecoc.olb") .NES. "" THEN DELETE tecoc.olb;*
$ LIBRARY/CREATE/OBJECT tecoc
$
$!
$!  Generate the C include file containing the macro that parses the command
$!  line used to invoke TECO.  The commented version is in CLPARS.TES.  Use
$!  the SQU macro to squish it into CLPARS.TEC.
$!
$!	This line is commented out because of a bug in TECO32.  TECO32 will
$!  generate an "Opcode resrved to Digital fault" when run from BATCH.
$!
$! mung tec$library:squ clpars.tec=clpars.tes/D:N/L:Y/B:Y/T:N/C:*/W:N/A:Y/E:N
$ CC/NOLIST genclp
$ LINK/NOMAP genclp,sys$share:cshare/OPTIONS
$ DELETE genclp.obj;*
$ RUN genclp
$ DELETE/NOLOG genclp.exe;
$
$ CALL xcc BakSrc
$ CALL xcc BldStr
$ CALL xcc ClenUp
$ CALL xcc CMatch
$ CALL xcc DoCJR
$ CALL xcc DoEvEs
$ CALL xcc DoFlag
$ CALL xcc EchoIt
$ CALL xcc Err
$ CALL xcc ExeA
$ CALL xcc ExeAtS
$ CALL xcc ExeB
$ CALL xcc ExeBar
$ CALL xcc ExeBsl
$ CALL xcc ExeC
$ CALL xcc ExeCCC
$ CALL xcc ExeCln
$ CALL xcc ExeCom
$ CALL xcc ExeCrt
$ CALL xcc ExeCSt
$ CALL xcc ExeCtA
$ CALL xcc ExeCtC
$ CALL xcc ExeCtD
$ CALL xcc ExeCtE
$ CALL xcc ExeCtI
$ CALL xcc ExeCtL
$ CALL xcc ExeCtN
$ CALL xcc ExeCtO
$ CALL xcc ExeCtP
$ CALL xcc ExeCtQ
$ CALL xcc ExeCtR
$ CALL xcc ExeCtS
$ CALL xcc ExeCtT
$ CALL xcc ExeCtU
$ CALL xcc ExeCtV
$ CALL xcc ExeCtW
$ CALL xcc ExeCtX
$ CALL xcc ExeCtY
$ CALL xcc ExeCtZ
$ CALL xcc ExeD
$ CALL xcc ExeDgt
$ CALL xcc ExeDot
$ CALL xcc ExeDQU
$ CALL xcc ExeE
$ CALL xcc ExeEqu
$ CALL xcc ExeEsc
$ CALL xcc ExeExc
$ CALL xcc ExeEY
$ CALL xcc ExeF
$ CALL xcc ExeFB
$ CALL xcc ExeG
$ CALL xcc ExeGtr
$ CALL xcc ExeH
$ CALL xcc ExeI
$ CALL xcc ExeILL
$ CALL xcc ExeJ
$ CALL xcc ExeK
$ CALL xcc ExeL
$ CALL xcc ExeLBr
$ CALL xcc ExeLst
$ CALL xcc ExeM
$ CALL xcc ExeN
$ CALL xcc ExeNul
$ CALL xcc ExeNYI
$ CALL xcc ExeO
$ CALL xcc ExeOpr
$ CALL xcc ExeP
$ CALL xcc ExePrc
$ CALL xcc ExePW
$ CALL xcc ExeQ
$ CALL xcc ExeQes
$ CALL xcc ExeR
$ CALL xcc ExeRBr
$ CALL xcc ExeRtP
$ CALL xcc ExeS
$ CALL xcc ExeSCl
$ CALL xcc ExeT
$ CALL xcc ExeU
$ CALL xcc ExeUnd
$ CALL xcc ExeUsc
$ CALL xcc ExeV
$ CALL xcc ExeW
$ CALL xcc ExeX
$ CALL xcc ExeY
$ CALL xcc ExeZ
$ CALL xcc FindES
$ CALL xcc FindQR
$ CALL xcc FlowEC
$ CALL xcc FlowEE
$ CALL xcc FlowEL
$ CALL xcc GetAra
$ CALL xcc GetNmA
$ CALL xcc IncCBP
$ CALL xcc Init
$ CALL xcc InsStr
$ CALL xcc IsRadx
$ CALL xcc Ln2Chr
$ CALL xcc MakDBf
$ CALL xcc MakRom
$ CALL xcc PopMac
$ CALL xcc PshMac
$ CALL xcc PushEx
$ CALL xcc RdLine
$ CALL xcc RdPage
$ CALL xcc ReadCs
$ CALL xcc Replac
$ CALL xcc Search
$ CALL xcc SinglP
$ CALL xcc SkpCmd
$ CALL xcc SrcLop
$ CALL xcc SSerch
$ CALL xcc TAbort
$ CALL xcc TypBuf
$ CALL xcc TypESt
$ CALL xcc UMinus
$ CALL xcc WrPage
$ CALL xcc ZFrSrc
$ CALL xcc Zvms
$ EXIT
$
$xcc: SUBROUTINE
$ CC'cflags' 'p1'
$ LIBRARY/INSERT tecoc 'p1'
$ DELETE/NOLOG 'p1'.obj;*
$ENDSUBROUTINE
