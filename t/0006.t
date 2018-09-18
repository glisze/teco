#!/usr/bin/env expect
  variable t
proc p {a b} {
  global t
  set t 0
  set timeout 2
  puts "$a $b"
}
proc a {a b} {
  global t
  incr t
  send "$a"
  expect {
    -re "$b" { exp_continue}
    "*\$ "   { puts "\nok $t"}
    default  { puts "\nnot ok $t"}
  }
}
p {1..7} { todo 1 2 3 4 5 6 7}
incr t
if {[catch "spawn nononotso"]==0} {
  puts "\nok $t"
  a "\r" {nothing}
  a "guile --version|head -1\r" {.*Guile.*\n}
  a "git --version|head -1\r" {.*git version.*\n}
  a "ld --version|head -1\r" {.*Binutils.*\n}
  a "gcc --version|head -1\r" {.*gcc.*\n}
  a "whereis tecoc\r" {.*tecoc.*\n}
} {puts "not ok $t # not running tecoc - no further tests here"
  for {set :-) 1} {[incr :-)] <= 7} {} {puts "\nnot ok [set :-)]\n"}
}
