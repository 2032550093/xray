#!/bin/bash
# Debian 9 & 10 x64
# Ubuntu 18.04 & 20.04 x64
# License forever-FREE-trial Autosript XRay by Du(^_^)De

# info
clear
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 INFO SERVER                \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )

# clear
if [ "$cekup" = "day" ]; then
echo -e "System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e "System Uptime   :  $uphours $upminutes"
fi
echo -e "IP-VPS          :  $IPVPS"
echo -e "ISP-VPS         :  $ISPVPS"
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                 ┃Autosript XRay by Du(^_^)De┃                 ║" 
echo "╚═════════════════════════════════════════════════════════════════╝"
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                    ┃Email: sc@dude.my.id┃                     ║" 
echo "╚═════════════════════════════════════════════════════════════════╝"
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                        ┃ XRAY XMENU ┃                         ║" 
echo "╚═══════════════════════════════════════════════════════=═════════╝"  
echo "║ 1. Create Account         ┃ Create Account                     ║"
echo "║ 2. Delete Account         ┃ Delete Account                     ║"
echo "║ 3. Chek Domain            ┃ Checking Domain Name               ║"
echo "║ 4. Chek IP                ┃ Checking Public IP                 ║"
echo "║ 5. Check Port             ┃ Check All Port Service             ║"
echo "║ 6. Restart                ┃ Restart XRay Service               ║"
echo "║ 7. Renew SSL/TLS          ┃ Renew SSL/TLS Certificate          ║"
echo "║ 8. Speedtest              ┃ Speedtest                          ║"
echo "║ 9. Reboot                 ┃ Reboot                             ║"
echo "║ 10.Exit                   ┃ Exit XRay Menu                     ║"
echo "║ 11.About                  ┃ Information About AutoScript       ║"
echo "║ 12.Webmin                 ┃ Setup Webmin                       ║"
echo "║ 13.Update                 ┃ Update                             ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-69 or x] :  " xmenu
case $xmenu in 
1)
add-akun
;;
2)
delete-akun
;;
3)
cat /etc/xray/domain
;;
4)
curl -s ipinfo.io/ip
;;
5)
cek-port
;;
6)
restart-xray
;;
7)
renew-cert
;;
8)
speedtest
;;
9)
reboot
;;
10)
exit
;;
11)
cat /root/log-install.txt
;;
12)
webmin
;;
13)
update
;;
*)
echo "Input The Correct Number !"
;;
esac