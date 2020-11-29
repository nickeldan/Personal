#!/bin/bash -e

usage() {
	echo "Usage: sil <executable> [<arguments>]"
}

if [ $# -eq 0 ]; then
	usage
	exit 1
fi

if [ "$1" == "-h" ]; then
	usage
	exit 0
fi

if [ ! -x $1 ] && [ ! -x $(which $1) ]; then
	echo "'$1' is not executable."
	exit 2
fi

$@ 2> /dev/null &
echo $!
