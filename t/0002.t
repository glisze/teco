#!/usr/bin/env expect
set a tecoc
puts "1..1 todo 1\n"
set t 1
set b [catch "spawn $a"]
if {$b==0} {
expect "*\*"
send "\027\027"
expect "*\*" { puts "ok $t\n"; exit 0}
puts "not ok $t\n"; exit 1
} {puts "not ok $t # spawn $a"}
