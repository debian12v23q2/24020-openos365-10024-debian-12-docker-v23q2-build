#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH
down_name=$(cat down.txt)
pname=$(echo $down_name | cut -d '/' -f2)

export GIT_CLONE_PROTECTION_ACTIVE=false

git clone git@github.com:${down_name}.git build
cd build

export GITHUB_REPOSITORY="openos365/${pname}"

df -h
./9.rsyslog.setup.sh 1
./ci/1.ci.run.sh >> /var/log/actions.log 2>&1
./8.upload.actions.log.sh
df -h

date
