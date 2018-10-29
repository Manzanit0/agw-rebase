#!/usr/bin/ruby -w

# Loads 'lib/' to the $LOAD_PATH
libdir = File.dirname(__FILE__) + '/lib/'
puts libdir
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "console/console"

console = Console.new
console.play