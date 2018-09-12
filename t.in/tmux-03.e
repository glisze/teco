#!/usr/bin/env expect
  variable t
proc p {a b} {
  global t
  set t 0
  set timeout 1
  puts "$a todo $b"
}
proc a {a b} {
  global t
  incr t
  send "$a"
  expect {
   "$b" { puts "ok $t";}
    default { puts "not ok $t";}
  }
}
spawn tmux
p {1..1} {}
a "\r" "*\$ "
a ". Fn/002_\r" "*\$ " 
a "002_\r" "*\$ "
a "cd t/\r" "*\$ "
a "002_\r" "*\$ "
a "pushd /home/share/t/0020/teco\r" "*\$ "
a "002_\r" "*\$ "
a "00-hash-p-te\r" "*\$ "
a "dirs\r" "*\$ "
a "pushd /home/source-7/gunter\r" "*\$ "
a "002_\r" "*\$ "
a "pushd /home/repo-7/6\r" "*\$ "
a "002_\r" "*\$ "
a "pushd +2\r" "*\$ "
send "\r"
interact
