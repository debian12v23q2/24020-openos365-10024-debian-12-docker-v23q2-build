#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

if [ ! -z "${GITHUB_REPOSITORY}" ];then
    cd $CMD_PATH
    
    export pname=$(echo ${GITHUB_REPOSITORY} | cut -d '/' -f 2) 
    mkdir -p /home/runner/work/$pname/$pname/docker/
    cd /home/runner/work/$pname/$pname/docker/
    ls -al

    cd $CMD_PATH
    sudo systemctl stop docker.socket
    sudo systemctl stop docker
    cp -fv daemon.json ~/daemon.json
    sed -i "s/24019-openos365-10024-debian-12-docker-v23q1/$pname/g" ~/daemon.json
    cat ~/daemon.json
    sudo mkdir -p /etc/systemd/system/docker.service.d/
    sudo cp -fv env.conf /etc/systemd/system/docker.service.d/env.conf
    sudo cat /etc/systemd/system/docker.service.d/env.conf
    sudo cp -fv ~/daemon.json /etc/docker/daemon.json
    sudo systemctl daemon-reload
    sudo systemctl start docker

    git config --global user.email "gnuhub@gmail.com"
    git config --global user.name "gnuhub"

    git remote -v
    git remote set-url origin git@github.com:${GITHUB_REPOSITORY}.git
    git remote -v
    export GITHUB_REPOSITORY="openos365/$pname"

    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "frs.sourceforge.net"
    ssh-keyscan "frs.sourceforge.net" >> $HOME/.ssh/known_hosts
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "github.com"
    ssh-keyscan "github.com" >> $HOME/.ssh/known_hosts
    cat $HOME/.ssh/known_hosts

    sudo cp ./p2 /usr/bin/p2

    cd $CMD_PATH
    ./ci/1.ci.run.sh
fi
echo "============================================================================"
