#!/usr/bin/env expect
set build "tecoc-0.0.73-6474/"
puts "1..1 todo 1\n"
set t 1
spawn $build/src/tecoc
expect "*\*"
send "\027\027"
expect "*\*" { puts "ok $t\n"; exit 0}
puts "not ok $t\n"; exit 1
