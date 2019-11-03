class Api::V1::ForecastController < ApplicationController
  def index
    geocoding = GoogleApiService.new(location_params)

    darksky = DarkskyApiService.new(geocoding.latitude, geocoding.longitude)
    dark_parsed = darksky.response

    current = CurrentForecast.new(@country_location, dark_parsed)

    daily = dark_parsed[:daily][:data].map do |day|
      DailyForecast.new(day)
    end.take(5)

    hourly = dark_parsed[:hourly][:data].map do |hour|
      HourlyForecast.new(hour)
    end.take(8)
    
    full_forecast = ForecastFacade.new(current, daily, hourly)
    render json: ForecastSerializer.new(full_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
