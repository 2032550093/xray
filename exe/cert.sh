#!/bin/bash
# Debian 9 & 10 x64
# Ubuntu 18.04 & 20.04 x64
# License forever-FREE-trial Autosript XRay by Du(^_^)De

# Color
red='\e[0;31m'
lred='\e[1;31m'
green='\e[0;32m'
lgreen='\e[1;32m'
gold='\e[0;33m'
yellow='\e[1;33m'
blue='\e[0;34m'
lblue='\e[1;34m'
purple='\e[0;35m'
lpurple='\e[1;35m'
cyan='\e[0;36m'
lcyan='\e[1;36m'
NC='\e[0m'

#ip
MYIP=$(wget -qO- https://icanhazip.com/)
IP=$(wget -qO- https://icanhazip.com/);
domain=$(cat /etc/v2ray/domain)
echo -e " "
echo -e "${yellow}Checking IP...${NC}"
sleep 3
clear

#install socat
cd
apt update
apt -y install socat
clear

#renew cert progress
echo start
sleep 0.5
source /var/lib/crot/ipvps.conf
domain=$(cat /etc/xray/domain)
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
echo "During Certification... Port 80 is STOP..."
bash acme.sh --register-account -m sijeng-cert@yahoo.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
echo Done
sleep 3
cd