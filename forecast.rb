class Forecast

  def set_days
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
    "Today's weather: #{@weather_data[1]["fcttext"]} \n" +
    "=" * 50
  end

  def get_tonight
    "Tonight's weather: #{@weather_data[2]["fcttext"]} \n" +
    "=" * 50 + "\n"
  end

  def get_ten_day
    # "Tomorrow: #{@tomorrow}"
    @tenth_day
  end

end
