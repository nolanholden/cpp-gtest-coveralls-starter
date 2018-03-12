#!/usr/bin/env bash

git submodule update --init --recursive
mkdir b
cd b

# debug
cmake -DCMAKE_BUILD_TYPE=DEBUG -DCOVERAGE=1 ../
make
./test
valgrind --error-exitcode=42 --leak-check=full ./test

# plain
rm -rf ./*
cmake -DCOVERAGE=1 ../
make
./test
valgrind --error-exitcode=42 --leak-check=full ./test

