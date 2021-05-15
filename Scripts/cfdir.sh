#!/bin/bash -e

shopt -s nullglob

if [ $# -eq 0 ]; then
    echo "usage: $0 <directory1> [<directory2> ...]"
    exit 1
fi

for dir in $@; do
    if [ ! -d $dir ]; then
        echo "$dir is not a directory."
        exit 2
    fi

    for file in $dir/*.{h,c}; do
        clang-format -i $file
    done
done
