#!/bin/bash
# Debian 9 & 10 x64
# Ubuntu 18.04 & 20.04 x64
# License forever-FREE-trial Autosript XRay by Du(^_^)De

#color
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

#checking ip
MYIP=$(wget -qO- ipinfo.io/ip);

#link
dudevpn="raw.githubusercontent.com/2032550093/xray/1.0/dll"
cd

#Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

#nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.

sslh-fix-reboot
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 100
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 100
systemctl enable xray
systemctl restart xray
systemctl restart nginx
systemctl enable runn
systemctl restart runn
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
exit 0
END

#permission rc local
chmod +x /etc/rc.local

#enable rc local
systemctl enable rc-local
systemctl start rc-local.service

#set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

#setup system
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
 
#install tools
apt update
apt install -y net-tools bzip2 gzip coreutils curl ftp neofetch screen sudo wget zip libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev xl2tpd pptpd

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

#Install Requirements Tools
apt install ruby -y
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y

#reinstall & fix missing install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

#install webserver nginx
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://${dudevpn}/nginx.conf > /etc/nginx/nginx.conf
curl https://${dudevpn}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://${dudevpn}/index.html"
/etc/init.d/nginx restart

#restart nginx
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
sleep 3
cd