#!/usr/bin/env ruby
# frozen_string_literal: true

# Script to forcibly delete existing files that conflict with those to be
# stowed.
#
# Example:
#
# ```
# $ git clone --recurse-submodules https://github.com/jethrodaniel/dotfiles
# $ cd dotfiles
# $ stow home/
# WARNING! stowing home would cause conflicts:
#   * existing target is not owned by stow: .bash_aliases
#   ...
# All operations aborted.
# ```

files = `stow --simulate home 2>&1`
        .split("\n")
        .select { |line| line.include? 'existing target is not owned by stow' }
        .map do |line|
          file = line.match(/.*is not owned by stow: (?<file>.*)\z/)
                     .named_captures['file']
          "#{ENV['HOME']}/#{file}"
        end

files.each { |f| puts f }

print "Deleting all #{files.size} files, you cool with that? (yes): "

unless ENV['CI'] == 'true'
  unless gets.chomp == 'yes'
    puts
    puts 'Aborting!'
    exit 1
  end
end

files.each { |f| File.delete f }

puts 'Deleted em all.'
