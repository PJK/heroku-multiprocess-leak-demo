#!/usr/bin/env ruby
$stdout.sync = true
puts "[#{$$}] Launching"

array = [42] * 500_000
big_array = []

Process.setrlimit(Process::RLIMIT_AS,  250 * 1024 * 1024) if ARGV.include? '--limit'
system './leaker.rb' if ARGV.include? '--sub'


loop do
	puts "[#{$$}] I leak memory - #{`ps -o rss -p #{$$}`.strip.split.last.to_i / 1024} MB"
	big_array += array
	sleep 5
end
