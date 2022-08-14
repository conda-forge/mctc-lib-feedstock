#!/usr/bin/env bash

set -ex

mkdir -p $PREFIX/bin $PREFIX/share/man/man1
$FC $FFLAGS app/main.f90 -o $PREFIX/bin/mctc-convert $(pkg-config --cflags --libs mctc-lib)
asciidoctor -b manpage man/mctc-convert.1.adoc -o $PREFIX/share/man/man1/mctc-convert.1
