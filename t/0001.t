#!/usr/bin/env expect
puts "1..1\n"
set t 1
spawn [pwd]/t/tecoc
expect "*\*"
send "\027\027"
expect "*\*" { puts "ok $t\n"; exit 0}
puts "not ok $1\n"; exit 1
