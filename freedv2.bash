#!/bin/bash
# CloudFlare WARP Client Config generator for WireGuard
# forked by ads4freed
clear

if [ "$(uname -o)" != 'Android' ]; then
 echo -e "[\e[1;31mError\e[0m] This script is for Termux Android users only"
 exit 1
fi


echo -e ""
termux-setup-storage
echo -e "To continue configuring, press \e[1;32mAllow\e[0m\n"
sleep 3


cd storage/shared
rm -rf WireGuard && mkdir -p WireGuard
cd WireGuard
curl -4sO 'https://raw.githubusercontent.com/ads-freed/adswgwarp/master/ads4freed.py'
python ads4freed.py
cp wgcf-profile.conf ImportThis.conf
clear
echo -e "\n\nYour Cloudflare WARP client is Successfully Configured\nYour config is located at /storage/emulated/0/WireGuard/ImportThis.conf\nNow Open your WireGuard App then click the plus sign and then tap/click the 'Create from file or Archive'\nThen locate the WireGuard folder on your phone internal storage and click or tap the ImportThis.conf file\nAnd lastly tap/click the switch to run the VPN\n\n Enjoy Surfing!"
cd
exit 1
