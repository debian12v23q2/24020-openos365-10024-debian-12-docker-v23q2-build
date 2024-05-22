#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH

git clone git@github.com:debian12v23q3/24004-openos365-10024-debian12-docker-v23q3.git build
cd build

export GITHUB_REPOSITORY="openos365/24004-openos365-10024-debian12-docker-v23q3"

./4.ci.build.run.sh


date
