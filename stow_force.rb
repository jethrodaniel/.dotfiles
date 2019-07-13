#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

options = OptionParser.new do |opts|
  opts.banner = <<~SH
    Removes the files that stow can't. (relax, prompts first)

    $ ./stow_force <DIR>

    Required args:

        DIR - the stow package to force install

    Options:

  SH

  opts.on '-h', '--help', 'Prints this help' do
    puts opts
    exit
  end
end.parse!

abort 'Missing required argument <DIR>!' if ARGV.size != 1

package = options.first

abort "#{package} is not a directory!" unless Dir.exist? package

stow_output = `stow --simulate #{package} 2>&1`

abort stow_output if stow_output.include? 'ERROR'

stow_output = stow_output
              .gsub("WARNING: in simulation mode so not modifying filesystem.\n", '')
              .gsub("WARNING! stowing #{package} would cause conflicts:\n", '')
              .strip
              .split "\n"

abort 'Nothing to be forced!' if stow_output == []

unowned = stow_output.select do |line|
  line.include? 'existing target is not owned by stow'
end.map do |line|
  file = line.match(/.*is not owned by stow: (?<file>.*)\z/)
             .named_captures['file']
  "#{ENV['HOME']}/#{file}"
end

existing = stow_output.select do |line|
  line.include? 'existing target is stowed to a different package:'
end.map do |line|
  file = line.match(/.*existing target is stowed to a different package: (?<target>[^\s]*)/)
             .named_captures['target']
  "#{ENV['HOME']}/#{file}"
end

files = unowned + existing

print <<~MSG
  Deleting the following #{files.size} files:

  #{files.join "\n"}

MSG

print 'You cool with that? (y/n): '

answer = 'y'
answer = $stdin.gets.chomp unless ENV['CI']

if answer != 'y'
  puts "\nDoing nothing!"
  exit
end

files.each { |f| File.delete f }

puts "\nDeleted em all."
