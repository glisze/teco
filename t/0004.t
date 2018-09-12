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
      -re "$b" {
         send "\r"
         expect {
           "*\$ " { puts "ok $t"}
           default { puts "not ok $t"}
         }
      }
    default { puts "not ok $t";}
  }
}
p {1..5} {}
spawn bash
a "\r" {.*\$ }
a "guile --version|head -1\r" {.*Guile.*$}
a "git --version|head -1\r" {.*git version.*$}
a "ld --version|head -1\r" {.*Binutils.*$}
a "gcc --version|head -1\r" {.*gcc.*$}
