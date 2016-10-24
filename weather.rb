require 'httparty'
require 'optparse'

OptionParser.new do |opts|
  ARGV << '--help' if ARGV.empty?
  
  options = {}

  opts.banner = "Usage: example.rb [options]"

  opts.on("-z", "--zipcode", "Zipcode") do |v|
    options[:zipcode] = v
  end
end

def main
  key = 68cdcea85509e92d
  weather_request = OptionParser.new
  p weather_request
end

main if __FILE__ == $PROGRAM_NAME
