#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH
sudo cp ./p2 /usr/bin/p2

cd /
sudo df -h
date
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y tzdata
sudo ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
date
 
if [ ! -z $OPENOS365_DOWN_NAME ];then
	down_name=${OPENOS365_DOWN_NAME}
	cd ~/
	git clone -b ${GITHUB_REF_NAME} git@github.com:${down_name}.git build
	cd build
	echo "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)" >> ci.txt
	p2 "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)"
	cd ~
	rm -rf build
	date
fi

if [ ! -z $OPENOS365_DOWN_NAME2 ];then
	down_name=${OPENOS365_DOWN_NAME2}
	cd ~/
	git clone -b ${GITHUB_REF_NAME} git@github.com:${down_name}.git build
	cd build
	echo "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)" >> ci.txt
	p2 "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)"
	cd ~
	rm -rf build
	date
	cd build
	echo "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)" >> ci.txt
	p2 "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)"
	cd ~
	rm -rf build
	date
fi

