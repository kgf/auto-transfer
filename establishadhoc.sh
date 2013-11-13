# potential script that could be run as a cron job to force establishment of the ad-hoc network
# negates the need to muck with /etc/network/interfaces file

sudo ifconfig wlan0 down
sudo iwconfig wlan0 channel 1 essid BEMAPI mode ad-hoc
sudo ifconfig wlan0 up

# hopefully this is not necessary, but sometimes needed to force the nodes to see each other
sudo iwlist wlan0 scan

# have to assign unique IP address per node. Maybe from MYSQL database eventually??
ifconfig wlan0 192.168.1.1 netmask 255.255.255.0

# now we should be able to ping 192.168.1.2, 192.168.1.3, and start parsing and interpreting results
# use database to track well-named nodes, last connections, etc?

