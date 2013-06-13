#! /usr/bin/env ruby
#Exploring the option of using ruby instead of shell script. Allows easier processing and access to libraries for saving logs to sqlite perhaps.
#Interesting blog on various ways of making system calls here ;
#http://blog.jayfields.com/2006/06/ruby-kernel-system-exec-and-x.html
#We'll be using the result = %x(rsync) format

rsync_results = %x[rsync 2>&1]
#scan_results = %x[iwlist wlan0 scanning 2>&1]
scan_results = %x[iwlist wlan0 scan | egrep "Address|ESSID" | cut -d: -f2-]
puts "Results were: #{scan_results}"
scan_array = scan_results.split("\n")

puts scan_array.inspect
puts scan_array.class
puts scan_array(8)
