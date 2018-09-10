#!/usr/bin/env bash
VERSION="0.0.73-6474"
PACKAGE="teco"
SOURCE="tecoc-${VERSION}"
TARBALL="${SOURCE}.tar.xz"
DOWNLOAD="https://github.com/glisze/teco/releases/download/staging%2Fv0.0.73-6474/${TARBALL}"
echo "1..11"
wget -q ${DOWNLOAD} && echo "ok 1" || echo "not ok 1"
tar xf ${TARBALL} && echo "ok 2" || echo "not ok 2"
pushd ${SOURCE} && echo "ok 3" || echo "not ok 3"
./configure && echo "ok 4" || echo "not ok 4"
make V=0 && echo "ok 5" || echo "not ok 5"
mkdir -p dist/${PACKAGE}-${VERSION}/DEBIAN && echo "ok 6" || echo "not ok 6"
make V=0 DESTDIR="$( pwd )/dist/${PACKAGE}-${VERSION}" install && echo "ok 7" || echo "not ok 7"
cp -rv ../DEBIAN/* dist/${PACKAGE}-${VERSION}/DEBIAN/ && echo "ok 8" || echo "not ok 8"
dpkg-deb --build dist/${PACKAGE}-${VERSION} && echo "ok 9" || echo "not ok 9"
pwd || true
ls -l || true
ls -l dist || true
set || true
find dist/ || true
popd && echo "ok 10" || echo "not ok 10"
mv -v ${SOURCE}/dist/${PACKAGE}-${VERSION}/dist/${PACKAGE}-${VERSION} . && echo "ok 11" || echo "not ok 11"
