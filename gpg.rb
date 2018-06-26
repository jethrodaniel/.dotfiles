#!/usr/bin/env ruby

require 'json'
require 'open-uri'

def add_gpg_keys(user)
  url = "https://api.github.com/users/#{user}/gpg_keys"

  begin
    content = open(url)
  rescue OpenURI::HTTPError => e
    puts e
    exit
  end

  keys = JSON.parse(content.read)
              .map { |hash| hash['raw_key'] }

  puts "Found #{keys.size} keys for #{user} ...\n\n"

  temp = Tempfile.new

  keys.each { |key| temp.write key }

  temp.close

  %x(gpg -v --import #{temp.path})

  puts "\nAdded #{keys.size} keys for #{user}"
end

if __FILE__ == $0
  add_gpg_keys 'jethrodaniel'
end
