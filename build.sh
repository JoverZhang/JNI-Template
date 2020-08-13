#!/bin/bash

cd "$(dirname "$0")" || exit 1

rm -r build
mkdir build
cd build
cmake ..
make
