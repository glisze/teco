#!/usr/bin/env expect
set build "/home/travis/build/glisze/teco/tecoc-0.0.73-6474/"
puts "1..1\n"
set t 1
spawn $build/t/tecoc
expect "*\*"
send "\027\027"
expect "*\*" { puts "ok $t\n"; exit 0}
puts "not ok $1\n"; exit 1
