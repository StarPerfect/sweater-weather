class Api::V1::ForecastController < ApplicationController
  def index
    google = GoogleApiService.new
    darksky = DarkskyApiService.new(google.latitude({address: location_params}), google.longitude({address: location_params}))
    full_forecast = ForecastFacade.new(google.country_location({address: location_params}), darksky.response)
    render json: ForecastSerializer.new(full_forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
