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
    default  { puts "not ok $t"}
  }
}
p {1..5} {}
spawn bash
a "\r" {nothing}
a "guile --version|head -1\r" {.*Guile.*\n}
a "git --version|head -1\r" {.*git version.*\n}
a "ld --version|head -1\r" {.*Binutils.*\n}
a "gcc --version|head -1\r" {.*gcc.*\n}
