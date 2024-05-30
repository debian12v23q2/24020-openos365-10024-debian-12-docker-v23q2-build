#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH
up_name=$(cat up.txt)
pname2=$(echo $down_name | cut -d '/' -f2)

export GIT_CLONE_PROTECTION_ACTIVE=false

git clone -b ${GITHUB_REF_NAME} git@github.com:${up_name}.git build
cd build

export GITHUB_REPOSITORY="openos365/${pname2}"

df -h
./9.rsyslog.setup.sh 1
./ci/1.ci.run.sh >> /var/log/actions.log 2>&1
./8.upload.actions.log.sh
df -h

date
