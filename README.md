# teco
A clone of a port of the Text Editor and COrrector program

Unix Command line 
---- ------- ----

To make Unix users more comfortable,  TECO-C uses Unix-like options syntax
instead of the familiar "/" style used under VAX/VMS.  The options can be
abbreviated.  They are (optional characters in square brackets):

-in[spect]
-noc[reate]
-noi[ni]
-nom[emory]
-sc[roll]
-scroll:nnn:SEEALL
	do nnn,7:W and 1,3:W


-nop[age]
	Don't separate input into pages.  Instead,  treat form feeds as
	normal characters.
+nnn 
	where nnn is any number of digits. Go to line number nnn and set
	nopage. Note this uses the UNIX end of line convention for use with
        cc output &c. The non-unix line termination will still be used for
	nL and other intrinsic TECO commands, this just controls the
	starting line AT INVOCATION.
  
  
  EZ Mode Control Flag
-- ---- ------- ----

To add functionality,  TECO-C is sensitive to bits in an extra mode control
flag in addition to the standard ones.  Bits in the EZ mode control flag are
used in different ways by different operating systems.  Under Unix,  bits in
the flag have the following meanings:

 1	Mark Henderson,  who did much of the Unix port,  likes the way
	VAX/VMS	keeps versions of files.  VMS appends a semicolon followed
	by a version number to files,  and has the PURGE command to clean
	out old versions of files.  If this bit is off,  TECO-C will handle
	file version numbers,  appending the appropriate version number to
	file names.  Mark supplied a "purge" program (distributed with TECO-C)
	for users of this feature.  Setting this flag turns off the feature,
	to make TECO-C function as expected by the average Unix user.  This
	flag is set by default.

 8	I don't know what this flag does.  It only makes sense when TECO-C
	is compiled with CURSES support.

 16	If set, when it's time to beep,  use an audio beep,  and if it fails,
	then try a video flash.  If clear,  try a video flash,  and if it
	fails,  use an audio beep.  This bit works only if TECO-C was compiled
	with CURSES support.  This bit is off by default.

 32	If set,  and split screen scrolling mode is on (see the 7:W command),
	TECO-C puts a line between the upper and lower scrolling regions.
	If off,  don't display a line.  This bit works only if TECO-C was
	compiled with CURSES support.  This bit is off by default.

 128	If set,  don't stop on form feeds when reading.  If clear,  a form
	fed in the input stream stops the read (the standard TECO style).
	This bit is off by default.

 256	If set,  use Unix-style newline terminators.  This means when files
	are read in,  carriage-returns are not added to the end of lines,
	and when the user types the RETURN key,  only a newline is entered
	into the command line (usually a carriage-return/line-feed pair is
	entered).  Old macros (and old TECO users) may get confused if this
	bit is set,  but it's required if CURSES support is compiled into 
	TECO-C.

 2048	If set,  use a bottom-tee symbol instead of a diamond to indicate
	the end-of-buffer.  This bit works only if TECO-C was compiled with
	CURSES support.  This bit is off by default.
	
 8192	If set,  don't show CR in SCROLL mode (like standard TECO).  If clear,
	show CR (a graphics character indicating a carriage return) when in
	SCROLL mode.  This bit works only if TECO-C was compiled with CURSES
	support.  This bit is on by default.


Filename Memory
-------- ------

TECO tries to remember the last file edited by TECO,  so that after you've
edited a file once,  you can re-edit without having to type the file name
on the command line.  TECO-C implements this under Unix by writing and reading
files named /tmp/tecoxxx.tmp,  where "xxx" is the process id of the parent
process.


