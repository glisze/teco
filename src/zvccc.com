$!
$!  This command procedure compiles and libraries a C source file
$!
$ p1 = f$parse(p1,,,"NAME","SYNTAX_ONLY")
$ CC/NOLIST 'p1' 'p2'
$ IF .NOT. $status THEN GOTO done
$ LIBRARY/REPLACE/OBJECT tecoc.olb 'p1'.obj
$ DELETE 'p1'.obj;*
$done:
