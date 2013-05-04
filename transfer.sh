#!/bin/bash
#A shell script to scan for wifi networks, and perhaps transfer data if we find one we like
#This should use rsync over ssh. It will need some persistent storage to know who it talked to recently
# KGF 5/1/2013
echo "Current date : $(date) @ $(hostname)"

