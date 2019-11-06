class Api::V1::ForecastController < ApplicationController
  def index
    google = GoogleApiService.new({address: location_params}, 'geocode')
    darksky = DarkskyApiService.new(google.latitude, google.longitude)
    full_forecast = ForecastFacade.new(google.country_location, darksky.response)
    render json: ForecastSerializer.new(full_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
