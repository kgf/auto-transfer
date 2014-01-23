To get started with setting up your Raspberry Pi with Ruby, you’re going to need a few things:

1. Unpackage your Pi and the rest of the goodies, making sure not to transfer any electrostatic shock to the device -- a big no-no that could fry the device and make it worth slightly more than your next coolest desk toy. 

2. [Format the SD card](https://www.sdcard.org/downloads/formatter_4/) using another computer with an SD drive (internal or external). 

3. Meanwhile, download NOOBs (new out of box software) and sidestep the shame as you walk through the door…

4. Extract/unzip [NOOBs](http://www.raspberrypi.org/downloads) locally, copy all files contained within the folder (but not the folder itself), and paste the files onto the SD card. The files should be at the top level directory -- if they’re not, the Pi won’t boot properly.

5. Plug in the keyboard, mouse, (USB hub if you’ve got one), SD card,  HDMI cable, and finally the power supply. The monitor should show the Pi booting up to a GUI, in which you can select an OS to install. I first installed Raspbian.

6. Once Raspbian’s good to go, you’re going to want to make sure your keyboard is set to a US locale (assuming you’re, of course, in the US), as the default is the UK -- a fact which makes it a bit pesky to setup wifi configs among other things.

  ```shell
  sudo raspi-config
  ```

  * Select (4) Internationalization Options 
  * Select (3) Keyboard Layout
  * Select enter
  * Navigate to English (US) which is on the next page

7. Setup Wifi on the Pi

8. (optional -- complete this step if you want to control your pi remotely) Check your wifi setup by ssh’ing into the Pi from another computer 

  ```shell
  ssh <your pi ip address> -l <your pi username>
  # the pi ip address can be found by running: sudo hostname --ip-address
  # the pi username defaults to pi 
  # the pi password defaults to raspberry
    
  # your output should look something like:
  # Last login: Tue Jan 21 16:54:46 on ttys002
  # new-host-4:~ johncapecelatro$ ssh <your pi ip address> -l <your pi username>
  # pi@<your pi ip address>'s password: 
  # Linux raspberrypi 3.10.25+ #622 PREEMPT Fri Jan 3 18:41:00 GMT 2014 armv6l
   
  # The programs included with the Debian GNU/Linux system are free software
  # the exact distribution terms for each program are described in the
  # individual files in /usr/share/doc/*/copyright.
    
  # Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
  # permitted by applicable law.
  # Last login: Tue Jan 21 21:46:57 2014 from new-host-4.home
  # pi@raspberrypi ~ $
  ```
  
9. Install Ruby

  ```shell
  # install prerequisites
  sudo apt-get install -y git curl zlib1g-dev subversion

  # update the package index
  sudo apt-get update

  # install ruby dependencies 
  sudo apt-get install -y openssl libreadline6-dev git-core zlib1g libssl-dev
  sudo apt-get install -y libyaml-dev libsqlite3-dev sqlite3
  sudo apt-get install -y libxml2-dev libxslt-dev
  sudo apt-get install -y autoconf automake libtool bison

  # install ruby with RVM; append --rails if you'd like 
  curl -L get.rvm.io | bash -s stable    
  # after the packages are finished downloading and installing
  # check to make sure ruby is installed
  ruby -v
  # it should return something like: ruby 1.9.3p194 (2012-04-20 revision 35410) [arm-linux-eabihf]
  And there you have it -- you’re running Ruby (and Rails if you so wish) on your Pi!
  ```

References:

[RaspberryPi.org Quick Start Guide](http://www.raspberrypi.org/wp-content/uploads/2012/04/quick-start-guide-v2_1.pdf)
[RPi Ruby on Rails](http://elinux.org/RPi_Ruby_on_Rails)

