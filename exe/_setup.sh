#!/bin/bash
# Debian 9 & 10 x64
# Ubuntu 18.04 & 20.04 x64
# License forever-FREE-trial Autosript XRay by Du(^_^)De

#checking uuid
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

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

#check ip
MYIP=$(wget -qO- ipinfo.io/ip);
echo -e "${yellow}Checking IP...${NC}"
echo -e "${green}IP: ${MYIP}${NC}"
sleep 0.5
clear

#making file ip
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
cd

#install cf
clear
echo -e "${Info} Installing CF..."
sleep 1
wget https://raw.githubusercontent.com/2032550093/xray/1.0/exe/cf.sh && chmod +x cf.sh && ./cf.sh
echo " "
echo -e "${Info} CF is... Done"
sleep 1.5
#cert by acme.sh
clear
echo -e "${Info} Installing CA..."
sleep 1
wget https://raw.githubusercontent.com/2032550093/xray/1.0/exe/cert.sh && chmod +x cert.sh && ./cert.sh
echo " "
echo -e "${Info} CA is... Done"
sleep 1.5
#install tools
clear
echo -e "${Info} Installing Tools..."
sleep 1
wget https://raw.githubusercontent.com/2032550093/xray/1.0/exe/tools.sh && chmod +x tools.sh && ./tools.sh
echo " "
echo -e "${Info} Tools is... Done"
sleep 1.5
#instal xray
clear
echo -e "${Info} Installing XRay..."
sleep 1
wget https://raw.githubusercontent.com/2032550093/xray/1.0/exe/xray.sh && chmod +x xray.sh && ./xray.sh
echo " "
echo -e "${Info} XRay is.... Done"
sleep 1.5
#update
clear
echo -e "${Info} Updating Menu..."
sleep 1
wget https://raw.githubusercontent.com/2032550093/xray/1.0/menu/update.sh && chmod +x update.sh && ./update.sh
echo " "
echo -e "${Info} Menu is... Done"
sleep 1.5
#done

echo " "
echo "${green}Installation has been completed...!!!${NC}"
echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
echo -e "    AutoScript XRay by Du(^_^)De"  | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - Nginx                      : 89"  | tee -a log-install.txt
echo "   - XRAYS TROJAN WS TLS        : 443"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS WS TLS   : 443"  | tee -a log-install.txt
echo "   - XRAYS VLESS WS TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS VMESS WS TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS TROJAN WS HTTP       : 80"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS WS HTTP  : 80"  | tee -a log-install.txt
echo "   - XRAYS VLESS WS HTTP        : 80"  | tee -a log-install.txt
echo "   - XRAYS VMESS WS HTTP        : 80"  | tee -a log-install.txt
echo "   - XRAYS TROJAN GRPC          : 443"  | tee -a log-install.txt
echo "   - XRAYS SHADOWSOCKS GRPC     : 443"  | tee -a log-install.txt
echo "   - XRAYS VMESS GRPC           : 443"  | tee -a log-install.txt
echo "   - XRAYS VLESS GRPC           : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt

# remove used file
cd
rm -f _setup.sh
rm -f cf.sh
rm -f cert.sh
rm -f tools.sh
rm -f xray.sh
rm -f update.sh
