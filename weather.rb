require 'httparty'
require 'optparse'
require_relative 'forecast'

class WeatherData < Forecast
  def input_parser

    @options = {}

    OptionParser.new do |opts|

      ARGV << '--help' if ARGV.empty?

      opts.banner = "Usage: example.rb [options]"

      opts.on("-z", "--zipcode v" ) do |v|
        @options[:zipcode] = v
      end.parse!
    end
    @options
  end

  def get_url
    key = '68cdcea85509e92d'

    zipcode = @options[:zipcode]

    @url = "http://api.wunderground.com/api/#{key}/conditions/forecast10day/astronomy/alerts/currenthurricane/q/#{zipcode}.json"
  end

  def get_weather_data
    @weather_data = HTTParty.get(@url).parsed_response
    @sun_phase = @weather_data["sun_phase"]
    @alerts = @weather_data["alerts"]
    @hurricane = @weather_data["currenthurricane"][0]
    @weather_data = @weather_data["forecast"]["txt_forecast"]["forecastday"]
  end
end

def main
  data = WeatherData.new
  data.input_parser
  data.get_url
  data.get_weather_data
  puts data.get_sun_phase
  puts data.get_today
  puts data.get_tonight
  data.get_ten_day
  puts data.hurricane?
  puts data.alerts?
end

main if __FILE__ == $PROGRAM_NAME
