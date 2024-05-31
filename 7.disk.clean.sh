#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH

cd /opt/
ls -al

sudo docker system prune -a -f
apt list --installed
sudo apt remove php* -y
sudo apt remove ruby* -y
sudo apt remove go* -y
sudo apt remove mysql* -y
sudo apt remove apache2 -y
sudo apt remove ant -y
sudo apt remove aria2 -y
sudo apt remove microsoft-edge-stable -y
sudo apt remove postgresql-14 -y
sudo apt remove python* -y
sudo apt remove ruby* -y
sudo apt remove firefox* -y
sudo apt remove chrom* -y
sudo apt remove r* -y
sudo apt remove r-* -y
sudo apt remove temurin* -y
sudo apt remove adoptium* -y
sudo apt remove nginx* -y
sudo apt remove postgresql-client-common -y



sudo apt remove mono* -y
snap --help
snap list
sudo snap remove firefox
sudo snap remove gnome-42-2204
sudo snap remove gtk-common-themes
sudo snap remove lxd
sudo snap remove core22
sudo snap remove core20


sudo rm -rf /opt/actionarchivecache
sudo rm -rf /opt/az
ls -al /opt/containerd
sudo rm -rf /opt/google
sudo rm -rf /opt/hostedtoolcache
sudo rm -rf /opt/microsoft
sudo rm -rf /opt/mssql-tools
sudo rm -rf /opt/pipx
sudo rm -rf /opt/pipx_bin
sudo rm -rf /opt/post-generation
sudo rm -rf /opt/runner
sudo rm -rf /opt/runner-cache
sudo rm -rf /opt/vsts
# sudo rm -rf /usr/share/
sudo rm -rf /usr/local/
sudo rm -rf /usr/src/

sudo rm -rf /home/linuxbrew/
sudo rm -rf /home/runneradmin/.cargo/
sudo rm -rf /home/runneradmin/.composer/
sudo rm -rf /home/runneradmin/.dotnet/
sudo rm -rf /home/runneradmin/.nvm/
sudo rm -rf /home/runneradmin/.rustup/
sudo rm -rf /etc/skel/
sudo rm -rf /var/lib/snapd/

# sudo systemctl stop snapd
# sudo apt remove snapd -y
# sudo rm -rf /snap


rm -rf ~/.nvm/
rm -rf ~/.m2/
rm -rf ~/.rustup
rm -rf ~/.cargo
rm -rf ~/.dotnet
sudo ls -al /home/
sudo df -h
cd ~
du -h -d 1
cd /
sudo du -h -d 1
sudo apt clean -y

if command -v journalctl; then
    sudo journalctl --rotate
    sudo journalctl --vacuum-time=1s
fi

# delete all .gz and rotated file
sudo find /var/log -type f -regex ".*\.gz$" -delete
sudo find /var/log -type f -regex ".*\.[0-9]$" -delete

# wipe log files
sudo find /var/log/ -type f -exec cp /dev/null {} \;

sudo systemctl disable snapd 

sudo systemctl stop snapd.socket
sudo systemctl stop snapd 
sudo apt remove snapd -y

