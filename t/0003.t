#!/usr/bin/env bash
VERSION="0.0.73-6474"
PACKAGE="teco"
SOURCE="tecoc-${VERSION}"
TARBALL="${SOURCE}.tar.xz"
DOWNLOAD="https://github.com/glisze/teco/releases/download/staging%2Fv0.0.73-6474/${TARBALL}"
echo "1..2"
# sudo dpkg --install ${PACKAGE}-${VERSION}.deb && echo "ok 1" || echo "not ok 1"
pwd || true
ls -l || true
which tecoc && echo "ok 2" || echo "not ok 2"
