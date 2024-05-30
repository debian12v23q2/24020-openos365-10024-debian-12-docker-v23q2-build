#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

export GITHUB_REPOSITORY=openos365/$PROJECT_NAME
export GITHUB_REF_NAME=dev
export GITHUB_RUN_NUMBER=1
./1.ci.caller.sh
