#!/usr/bin/env bash

set -ex

meson setup \
    _build \
    ${MESON_ARGS:---prefix=${PREFIX} --libdir=lib} \
    --default-library=shared \
    --wrap-mode=nofallback \
    --buildtype=release

meson compile -C _build
if [[ ${CONDA_BUILD_CROSS_COMPILATION:-0} == "1" ]]; then
  meson test -C _build --no-rebuild --print-errorlogs
fi
meson install -C _build --no-rebuild
rm $PREFIX/bin/mctc-convert

