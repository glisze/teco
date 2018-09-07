#!/usr/bin/env bash
echo -n "1"
echo -n "..11"
echo -n " todo "
echo -n "1 2"
echo -n "\n"
rm t/tecoc || true
rm t/tecoc-dir || true
ln -sv $( guix build -L ./packages -K --verbosity=0 teco ) t/tecoc-dir && echo "ok 1" || echo "not ok 1"
ln -sv $( readlink -e t/tecoc-dir/bin/tecoc ) t/tecoc && echo "ok 2" || echo "not ok 2"
wget https://github.com/glisze/teco/releases/staging%2Fv0.0.73-6474.tar.xz && echo "ok 3" || echo "not ok 3"
tar xf staging%2Fv0.0.73-6474.tar.xz && echo "ok 4" || echo "not ok 4"
pushd staging%2Fv0.0.73-6474 && echo "ok 5" || echo "not ok 5"
./bootstrap && echo "ok 6" || echo "not ok 6"
./configure && echo "ok 7" || echo "not ok 7"
./make V=0 && echo "ok 8" || echo "not ok 8"
ln -sv $( pwd )/ ../t/tecoc-dir && echo "ok 9" || echo "not ok 9"
popd && echo "ok 10" || echo "not ok 10"
ln -sv src/tecoc t/tecoc && echo "ok 11" || echo "not ok 11"
