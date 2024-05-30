#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH

export GIT_CLONE_PROTECTION_ACTIVE=false
down_name=$(cat down.txt)
pname=$(echo $down_name | cut -d '/' -f2)
git clone git@github.com:${down_name}.git build
cd build

export GITHUB_REPOSITORY="openos365/24004-openos365-10024-debian12-docker-v23q3"

df -h
./9.rsyslog.setup.sh 1
# ./4.ci.build.run.sh > ~/4.ci.build.run.sh.big.log.txt 2>&1
./8.upload.big.log.sh
df -h

date
