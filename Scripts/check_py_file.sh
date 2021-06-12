#!/bin/bash -e

LINE_LENGTH=110

black_cmd() {
    black -l $LINE_LENGTH $@
}

flake8_cmd() {
    flake8 --max-line-length $LINE_LENGTH $@
}

if [ $# -eq 0 ]; then
    files=$(find . -path '*/\.*' -prune -false -o -name '*.py')
    black_cmd $files
    flake8_cmd $files
else
    filename=$1
    if [ ! -f $filename ]; then
        echo "$filename is not a regular file"
        exit 1
    fi
    black_cmd $filename
    flake8_cmd $filename
fi
