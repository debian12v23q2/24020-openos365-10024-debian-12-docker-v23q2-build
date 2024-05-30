#!/usr/bin/env bash
set +x
export CMD_PATH=$(cd `dirname $0`; pwd)
export TERM=xterm-256color
cd $CMD_PATH
cd ci/mychroot/ci/conf/scripts

for myscript in `ls d3/*.sh`

do
	echo $myscript
	rm -rf *.sh
	rm -rf *.sh2
	cp -fv $myscript .
	p2 "test $myscript"
done