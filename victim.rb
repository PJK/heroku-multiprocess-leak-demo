#!/usr/bin/env ruby
$stdout.sync = true

loop do
	puts "[#{$$}] I mean no harm - #{Time.new}"
	system 'free -h'
	sleep 5
end
