#!/bin/bash -e

if [ $# -eq 0 ]; then
    echo "usage: $0 <directory>"
    exit 1
fi

dir=$1
if [ ! -d $dir ]; then
    echo "$dir is not a directory."
    exit 2
fi
if [ ! -w $dir ]; then
    echo "No write permission for $dir."
    exit 2
fi

for file in $dir/*.{h,c}; do
    clang-format -i $file
done
