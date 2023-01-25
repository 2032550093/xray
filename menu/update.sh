#!/bin/bash
# Debian 9 & 10 x64
# Ubuntu 18.04 & 20.04 x64
# License forever-FREE-trial Autosript XRay by Du(^_^)De

# download file update
cd
rm -f update
wget -O update "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/update.sh"

# delete old menu
cd /usr/bin
rm -f add-akun
rm -f auto-pointing
rm -f cek-port
rm -f renew-cert
rm -f renew-cert-lets
rm -f delete-akun
rm -f restart-xray
rm -f update
rm -f xmenu
rm -f speedtest
rm -f webmin

# download file menu
cd /usr/bin
wget -O add-akun "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/add-akun.sh"
wget -O auto-pointing "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/auto-pointing.sh"
wget -O cek-port "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/cek-port.sh"
wget -O renew-cert "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/renew-cert.sh"
wget -O renew-cert-lets "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/renew-cert-lets.sh"
wget -O delete-akun "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/delete-akun.sh"
wget -O restart-xray "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/restart-xray.sh"
wget -O update "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/update.sh"
wget -O xmenu "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/xmenu.sh"

# download menu tools
wget -O speedtest "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/speedtest_cli.py"
wget -O webmin "https://raw.githubusercontent.com/2032550093/xray/1.0/menu/webmin.sh"

# chmod
chmod +x /usr/bin/update
chmod +x /usr/bin/xmenu
chmod +x add-akun
chmod +x auto-pointing
chmod +x cek-port
chmod +x renew-cert
chmod +x renew-cert-lets
chmod +x delete-akun
chmod +x restart-xray
chmod +x update
chmod +x xmenu
chmod +x speedtest
chmod +x webmin
cd