#!/usr/bin/env expect
puts "1..1 todo 1\n"
set t 1
spawn tecoc
expect "*\*"
send "\027\027"
expect "*\*" { puts "ok $t\n"; exit 0}
puts "not ok $t\n"; exit 1
