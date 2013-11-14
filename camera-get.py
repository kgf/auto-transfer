import subprocess
import os
from datetime import datetime

basedir = 'autotransfer'
uniqueaddress = '/sys/class/net/eth0/address'

os.chdir(os.environ["HOME"])
if not os.path.exists(basedir):
	os.mkdir(basedir)

os.chdir(basedir)
macdir = './' + open(uniqueaddress).read().replace(':','x')

if not os.path.exists(macdir):
	os.mkdir(macdir)

os.chdir(macdir)

d = datetime.now()

subprocess.call("gphoto2 --get-all-files --force-overwrite --debug > autotransfer " + d.isoformat() + ".log")

os.chdir(os.environ["HOME"])

