#!/usr/bin/env ruby

# Add Global Gems
if defined?(::Bundler)
  gemset = ENV['GEM_PATH'].split(':').grep(/(ruby|jruby|rbx).*@global/).first
  if gemset
    gemset_paths = Dir.glob("#{gemset}/gems/*")
    gemset_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

# Load Pry
require 'rubygems'
require 'pry'
Pry.start
exit
