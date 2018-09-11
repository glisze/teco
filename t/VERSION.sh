VERSION=$( sed README.md -e '/teco\/releases\/tag/!d' -e 's,^.*v\(.*\)$,\1,' )
