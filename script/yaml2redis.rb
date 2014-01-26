#!/usr/bin/env ruby
require 'yaml'
require 'redis'
require 'json'

$redis = Redis.new(:host => 'localhost', :port => 6379)

# Main Logic
unless ARGV.empty?
  ARGV.each do |file|    
    $prefix = file.gsub('/',':').gsub('.yaml', '').gsub('.eyaml', '')[2, file.length]
    puts "Open #{file} with #{$prefix}"
    content = YAML.load_file(File.open(file))
    content.each do |key, value|
      case value
	when String
	  $redis.set("#{$prefix}:#{key}", "#{value}")
	when Array
	  value.each do |item |
	    $redis.rpush( "#{$prefix}:#{key}", "#{item}") 
	  end
	when Hash
	  value.each do |item, content |
	   $redis.hset("#{$prefix}:#{key}", "#{item}", "#{content}")    
	  end	
        end    
      end
    end
else
  puts "Warning: No Arguments given !"
end


  