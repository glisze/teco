#!/usr/bin/env expect
spawn ./tecoc
expect "*\*"
send "qy:@i//\027\027"
expect "*\*"
send "r\027\027"
expect "*\*"
send "0a:=t\027\027"
expect { "*45-\*" { puts "ok"}
  default  { puts "not ok"}}
send "ex\027\027"
puts " # QY option character, print its code and glyph\n"
