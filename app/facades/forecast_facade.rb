class ForecastFacade
  def initialize(location, forecast = {})
    @forecast = forecast
    @location = location
  end

  def current
    CurrentForecast.new(@location, @forecast)
  end

  def daily
    @forecast[:daily][:data].map do |day|
      DailyForecast.new(day)
    end.take(5)
  end

  def hourly
    @forecast[:hourly][:data].map do |hour|
      HourlyForecast.new(hour)
    end.take(8)
  end
end
