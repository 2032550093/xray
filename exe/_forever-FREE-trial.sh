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

#permission
cod=$(wget -qO- https://raw.githubusercontent.com/2032550093/xray/1.0/lic/key)
ran1=$(</dev/urandom tr -dc A-Za-z0-9 | head -c4)
ran2=$(</dev/urandom tr -dc A-Za-z0-9 | head -c4)
ran3=$(</dev/urandom tr -dc A-Za-z0-9 | head -c4)
clear
echo -e " "
echo -e "${green}======================================================================${NC}"
echo -e "Want to USE the ${gold}FREE TRIAL${NC} service, please ${yellow}COPY & PASTE the code below${NC}"
echo -e " "
echo -e "                     ${bblue}$cod-$ran1-$ran2-$ran3${NC}"
echo -e "${green}======================================================================${NC}"
echo -e " "
read -p "Paste the code here: " code
acc=$code
if [ $cod-$ran1-$ran2-$ran3 = $acc ]; then
echo -e " "
echo -e "    ${yellow}Thank You${NC}"
sleep 0.5
echo -e "${red}>>>${NC} ${gold}Du(^_^)De${NC} ${red}<<<${NC} "
sleep 1
echo -e " "
else
clear
echo -e "${red}====================${NC}"
echo -e "${lred}Permission Denied!!!${NC}";
echo -e "${red}====================${NC}"
echo -e " "
echo -e "${yellow}Want to Subscribe...${NC}"
echo -e " "
echo -e "Please Contact by,"
echo -e "Telegram: ${lblue}t.me/DuDeSePTuMa${NC}"
echo -e "Email   : ${lcyan}sc.dude.my.id@gmail.com${NC}"
echo -e " "
exit 0
fi
clear

#set timezone GMT +7
cd
rm -rf /etc/localtime
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
timedatectl set-timezone Asia/Jakarta
echo -e "${yellow}Checking Timezone...${NC}"
echo -e " "
timedatectl
sleep 3
echo -e " "
echo -e "${yellow}Checking Date...${NC}"
echo -e " "
date
sleep 3
clear

#setup
cd
wget https://raw.githubusercontent.com/2032550093/xray/1.0/exe/_setup.sh; chmod +x _setup.sh; ./_setup.sh

#remove used file
cd
rm -f _forever-FREE-trial.sh

#signature
echo " "
sleep 0.5
echo -e "${Info}${lblue}Everything is...${NC} ${green}DONE${NC}"
sleep 1.5
echo -e " "
echo -e "    ${yellow}Thank You${NC}"
sleep 0.5
echo -e "${red}>>>${NC} ${gold}Du(^_^)De${NC} ${red}<<<${NC} "
echo " "

#reboot
echo " Reboot"
sleep 3
