auto-transfer
=============

Allows many wifi systems to exchange files whenever they are within range of each other. A simple use case for this is when using an in-vehicle-information system, this would automatically update your music library from your home network. A second and more 
interesting example would be during an emergency. When disaster assessment teams are out taking photos, they could transfer the results until someone finally came near to the EOC. It's kinda like a mesh network, but without the complexity.


Some of the Gory Details
-------------------------

I have considered using a mesh network, such as BATMAN and Byzantium. I have also considered using an ad-hoc network. The problem with both of these network modes is that they are not supported by most smartphones or wifi enabled cameras. With this limitation, I 
would need two wifi radios, one for camera to system, and one between systems. Well, if I need two anyway, perhaps I should just use one as client and one as access point.

Hardware
--------
I am basing this on small Linux based single board computers, such as the Beaglebone Black and the ubiquitous Raspberry Pi. I have two Pis for testing, and I just received a Beaglebone Black. I was delighted to 
see that it was made in the USA ! 
Radios will be USB dongles. Even within the USB dongles there are a lot of choices. I am currently looking at the Netis line of cards, as they list Linux as a supported operating system. This means that the internal 
chipset is less likely to change to something Linux doesn't like. 

Software
--------
A suite of command line tools
* ssh to authenticate
* rsync to actually move the bits
* sqlite to keep track of the sessions
* iw tools and other wireless tools
* possibly Ruby since everything looks like a nail

Useful Commands
---------------
* lsusb and lsusb -v show many details about the wifi adapters
* iwlist scan wlan0

Basic Workflow
--------------
* Get a list of visible wifi access points
* Filter this list to the ones we're willing to associate with
* Lookup which one we haven't seen in the longest
* Connect via wifi
* Start rsync over ssh
* Disconnect
* Repeat
* 

Data structures: File directories
----------------------------
* Base directory is off of user home directory
* Base directory name, by default, is "autotransfer"
* Subdirectories in autotransfer contain images from each pi, including the local one
* Subdirectories are named using a scrubbed version of the ethernet mac address for every pi
* Within each subdirectory, the image directory file structure from the camera will be reflected.
* This same directory structure is used on all pi devices running autotransfer
* Example, given 2 pi's (one local, one remote)

'''
/usr/home/pi
	./autotransfer
		./F0xDExF1x52xA7x98 (local pi)
			./dcim
				./camera
					20131021_132059.jpg
					20131021_132559.jpg
					20131021_133059.jpg
					20131021_133559.jpg
				./video
					20131017_101529.mp4
		./A0x88xB4x1DxOFxFC (remote pi)
			./dcim
				./camera
					20131021_100530.jpg
					20131021_200510.jpg
'''
				
Data structures: Tracking last sync with remote pis
---------------------------------------------------

TBD

Sub workflow: Grabbing images from the local camera
---------------------------------------------------
* see camera-get.py
* Proposed flow:
	* Change to user home directory
	* Make if missing, change to autotransfer subdirectory
	* Make if missing, change to uniquely named subdirectory
	* Execute gphoto2 to get all images from attached camera device, recurse through directories
	* Change back to user home directory


Sub workflow: Initializing the ad-hoc network
---------------------------------------------
In etc/network/interfaces:
```
# Common settings for all devices
auto wlan0
allow-hotplug wlan0
iface wlan0 inet static
wireless-essid "BEMAPI"
wireless-channel 1                
wireless-mode ad-hoc
wireless-ap 11:5F:02:38:5C:45     
netmask 255.255.255.0
# Unique setting needed for each PI
address 192.168.10.1              
```
