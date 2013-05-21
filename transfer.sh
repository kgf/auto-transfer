#!/bin/bash
#A shell script to scan for wifi networks, and perhaps transfer data if we find one we like
#This should use rsync over ssh. It will need some persistent storage to know who it talked to recently
# KGF 5/1/2013
echo "Current date : $(date) @ $(hostname)"

#This is a first pass at what the rsync might look like. May be too much UI sruff here, like verbose, progress and human-readable
#rsync --verbose --progress --stats --compress  --rsh=/usr/bin/ssh  --recursive --times --perms --links  --exclude 'cache' --exclude 'tmp' /data/*.jpg car3@10.101.54.3:/data/car3/ --human-readable

