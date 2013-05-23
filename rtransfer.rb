#!/usr/local/bin/ruby
#Exploring the option of using ruby instead of shell script. Allows easier processing and access to libraries for saving logs to sqlite perhaps.
#Interesting blog on various ways of making system calls here ;
#http://blog.jayfields.com/2006/06/ruby-kernel-system-exec-and-x.html
#We'll be using the result = %x(rsync) format

rsync_result = %x(rsync)
puts "Results were: #{rsync_result}"
