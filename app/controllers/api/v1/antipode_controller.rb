class Api::V1::AntipodeController < ApplicationController
  def index
    geocoding = GoogleApiService.new(search_location)

    amypode = AmypodeApiService.new(geocoding.latitude, geocoding.longitude)

    

    binding.pry

  end

  private

  def search_location
    params.permit(:location)
  end
end
