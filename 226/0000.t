#!/usr/bin/env tclsh
# Unpack, make, and link into ./t
namespace eval 002 {
 set a [glob tecoc-0.0*tar.gz]
 proc un "{a [set a]}" {exec tar xf [set a]}
 un
 set b [glob -type d tecoc-0.0*]
 proc ma "{a [set b]}" {cd [set a]; exec sh ./configure; catch {exec sh -c make V=0};
  cd ../t
  exec ln -sv ../[set a]/src/tecoc ./ }
 ma
}
