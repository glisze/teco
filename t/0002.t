#!/usr/bin/env bash
VERSION="0.0.73-6474"
PACKAGE="teco"
SOURCE="tecoc-${VERSION}"
TARBALL="${SOURCE}.tar.xz"
DOWNLOAD="https://github.com/glisze/teco/releases/download/staging%2Fv0.0.73-6474/${TARBALL}"
echo -n "1"
echo -n "..11"
echo -n " todo "
echo -n "1 2 6"
echo -n "\n"
rm t/tecoc && echo "ok 1"  || echo "not ok 1"
rm t/tecoc-dir && echo "ok 2" || echo "not ok 2"
wget ${DOWNLOAD} && echo "ok 3" || echo "not ok 3"
tar xf ${TARBALL} && echo "ok 4" || echo "not ok 4"
pushd ${SOURCE} && echo "ok 5" || echo "not ok 5"
./bootstrap && echo "ok 6" || echo "not ok 6"
./configure && echo "ok 7" || echo "not ok 7"
make V=0 && echo "ok 8" || echo "not ok 8"
ln -sv $( pwd )/ ../t/tecoc-dir && echo "ok 9" || echo "not ok 9"
popd && echo "ok 10" || echo "not ok 10"
ln -sv src/tecoc t/tecoc && echo "ok 11" || echo "not ok 11"
mkdir -p dist/${PACKAGE}-${VERSION}/DEBIAN || true
make V=0 DESTDIR="$( pwd )/dist/${PACKAGE}-${VERSION}" install && echo "ok 12" || echo "not ok 12"
cp -rv debian/* dist/${PACKAGE}-${VERSION}/DEBIAN/ && echo "ok 13" || echo "not ok 13"
dpkg-deb --build dist/${PACKAGE}-${VERSION} && echo "ok 14" || echo "not ok 14"
pwd || true
ls -l || true
ls -l dist || true
set || true
find dist/ || true
