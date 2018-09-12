#!/usr/bin/env sh
exec guile --language=brainfuck -c \
'
    ++++++++         $c_0\gets8$
0   [>++++           $c_1\gets4$
1   [>++             $c_2\gets2$
    >+++             $c_3\gets3$
    >+++             $c_4\gets3$
    >+               $c_5\gets1$
    <<<<-            $DECR(c_1)$
    ]                repeat from 1 if $(c_1)\gt0$
    >+               $INCR(c_2)$
    >+               $INCR(c_3)$
    >-               $DECR(c_4)$
    >>+              $INCR(c_6)$
    [<]              left until $c=0 or $FIND(c_1)$
    <-               $DECR(c_0)$
    ]                repeat from 0 if $c_0\gt0$
    >>.              $OUT(c_2)$
    >---.            $OUT(c_3)$
    +++++++..+++.    $OUT('llo')$
    >>.              $OUT(c_5)$
    <-.              $OUT(c_4)$
    <.+++.
    ------.--------. $OUT(c_3 'orld')$
    >>+.>++.         $OUT(c_5 c_6 '!\n')$
    ]                start
'
