class Api::V1::ForecastController < ApplicationController
  def index
    geocoding = GoogleApiService.new(location_params)
    darksky = DarkskyApiService.new(geocoding.latitude, geocoding.longitude)
    dark_parsed = darksky.response
    full_forecast = ForecastFacade.new(geocoding.country_location, dark_parsed)
    render json: ForecastSerializer.new(full_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
