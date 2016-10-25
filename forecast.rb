require 'colorize'

class Forecast

  def get_ten_day
    i = 0
    while i < 20
      weather = [@weather_data[i]["title"], @weather_data[i]["fcttext"]]
      puts weather
      i += 1
      puts "=" * 50
    end
  end

  def get_today
    "\n" + "=" * 50 + "\n" +
    "Today's weather: #{@weather_data[1]["fcttext"]}\n".blue +
    "=" * 50
  end

  def get_tonight
    "Tonight's weather: #{@weather_data[2]["fcttext"]} \n" +
    "=" * 50 + "\n"
  end

  def hurricane?
    "\n" + "=" * 50 + "\n" +
    "#{@hurricane["stormInfo"]["stormName_Nice"]}\n" +
    "Category: #{@hurricane["forecast"][0]["Category"]}\n" +
    "Wind Class: #{@hurricane["track"][0]["Category"]}\n" +
    "Wind Speed: #{@hurricane["Current"]["WindSpeed"]["Mph"]}mph\n" +
    "Location: #{@hurricane["Current"]["lat"]} Latitude, #{@hurricane["Current"]["lon"]} Longitude." +
    "\n" + "=" * 50 + "\n"
  end

  def alerts?
    if @alerts.empty?
      "***There are no alerts to report at this location.***".green +
      "\n" + "=" * 50 + "\n"
    else
      @alerts.red
    end
  end

  def get_sun_phase
    "\n" + "=" * 50 + "\n" +
    "Sunrise: #{@sun_phase["sunrise"]["hour"]}:#{@sun_phase["sunrise"]["minute"]} a.m.\n".yellow +
    "Sunset: #{@sun_phase["sunset"]["hour"].to_i - 12}:#{@sun_phase["sunset"]["minute"]} p.m.".yellow +
    "\n" + "=" * 50 + "\n"
  end

end
