#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH
down_name=$(cat down.txt)
sudo cp ./p2 /usr/bin/p2

cd /
sudo df -h

cd ~/
git clone -b ${GITHUB_REF_NAME} git@github.com:${down_name}.git build


date
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y tzdata
sudo ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
date


cd build
echo "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)" > ci.txt
p2 "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)"
cd ~
rm -rf build
date
