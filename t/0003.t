#!/usr/bin/env bash
VERSION="0.0.73-6474"
PACKAGE="teco"
SOURCE="tecoc-${VERSION}"
TARBALL="${SOURCE}.tar.xz"
DOWNLOAD="https://github.com/glisze/teco/releases/download/staging%2Fv0.0.73-6474/${TARBALL}"
echo "1..11"
dpkg-deb --install ${PACKAGE}-${VERSION} && echo "ok 9" || echo "not ok 9"
pwd || true
ls -l || true
which tecoc && echo "ok 2" || echo "not ok 2"
