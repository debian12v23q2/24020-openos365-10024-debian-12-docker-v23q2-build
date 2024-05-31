#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH
git remote add upstream git@github.com:debian12v23q3/24004-openos365-10024-debian-12-docker-v23q3-build.git
git remote set-url origin git@github.com:debian12v23q3/24004-openos365-10024-debian-12-docker-v23q3-build.git
git pull origin dev
git pull origin test
