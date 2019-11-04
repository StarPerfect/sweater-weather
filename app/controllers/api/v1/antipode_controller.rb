class Api::V1::AntipodeController < ApplicationController
  def index
    geocoding = GoogleApiService.new(search_location)

    amypode = AmypodeApiService.new(geocoding.latitude, geocoding.longitude)
    amypode.get_antipode

    find_city = GoogleReverseGeocodingService.new
    antipode = find_city.get_city(amypode.get_antipode[:data][:attributes][:lat], amypode.get_antipode[:data][:attributes][:long])
    binding.pry

  end

  private

  def search_location
    params.permit(:location)
  end
end
