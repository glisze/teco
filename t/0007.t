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
    "*\*"   { puts "\nok $t"}
    default  { puts "\nnot ok $t"}
  }
}
p {1..10} { todo 1 2 3 4 5 6 7 8 9 10}
incr t
if {[catch "spawn tecoc"]==0} {
  puts "\nok $t"

  a "\027\027" {nothing}
  a "ht\027\027" {nothing}
  a "i\r\027\027" {nothing}
  a "z=\027\027" {2}
  a "hk\027\027" {nothing}
  a "256,1ezi\r\027z=\027\027" {1}

  a "hk\027\027" {nothing}
  a "i\rHello, world\027ht\027\027" {Hello, world}
  a "hk\027\027" {nothing}

} {
  puts "not ok $t # not running tecoc - no further tests here"
  for {set :-) 1} {[incr :-)] <= 10} {} {puts "\nnot ok [set :-)]\n"}
}
