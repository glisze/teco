#!/usr/bin/env bash
echo "1..2"
rm t/tecoc || true
rm t/tecoc-dir || true
ln -sv $( guix build -L ./packages -K --verbosity=0 teco ) t/tecoc-dir && echo "ok 1" || echo "not ok 1"
ln -sv $( readlink -e t/tecoc-dir/bin/tecoc ) t/tecoc && echo "ok 2" || echo "not ok 2"
