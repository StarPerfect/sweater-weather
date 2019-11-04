class Api::V1::ForecastController < ApplicationController
  def index
    geocoding = GoogleApiService.new
    darksky = DarkskyApiService.new(geocoding.latitude({address: location_params}), geocoding.longitude({address: location_params}))
    dark_parsed = darksky.response
    full_forecast = ForecastFacade.new(geocoding.country_location({address: location_params}), dark_parsed)
    render json: ForecastSerializer.new(full_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
