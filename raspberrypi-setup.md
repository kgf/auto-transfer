This is based on a Raspberry pi Model B 
=======================================

Not sure if it is a rev 2 or not.

Updated and upgraded
sudo apt-get update
sudo apt-get upgrade

install hostapd
sudo apt-get install hostapd hostap-utils

install iw
sudo apt-get install iw

These also pull in 
* wireless-regdb
* crda

However, when I run iw list, it reports nl80211 not found. This is with an Edimax wifi dongle
