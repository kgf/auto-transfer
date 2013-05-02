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
Radios will be USB dongles. Even within the USB dongles there are a  lot of choices. I am currently looking at the Netis line of cards, as they list Linux as a supported operating system. This means that the internal 
chipset is less likely to change to something Linux doesn't like. 

Software
--------
A suite of command line tools
* ssh to authenticate
* rsync to actually move the bits
* sqlite to keep track of the sessions
* iw tools and other wireless tools

Basic Workflow
--------------
* Get a list of visible wifi access points
* Filter this list to the ones we're willing to associate with
* Lookup which one we haven't seen in the longest
* Connect via wifi
* Start rsync over ssh
* Disconnect
* Repeat
