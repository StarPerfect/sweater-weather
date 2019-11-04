class Api::V1::AntipodeController < ApplicationController
  def index
    geocoding = GoogleApiService.new(search_location)

    amypode = AmypodeApiService.new(geocoding.latitude, geocoding.longitude)

    find_city = GoogleReverseGeocodingService.new
    antipode_city = find_city.get_city(amypode.get_antipode[:data][:attributes][:lat], amypode.get_antipode[:data][:attributes][:long])

    darksky = DarkskyApiService.new(amypode.get_antipode[:data][:attributes][:lat], amypode.get_antipode[:data][:attributes][:long])

    antipode = AntipodeFacade.new(search_location, antipode_city, darksky.response)
    binding.pry
    render json: AntipodeSerializer.new(antipode)
  end

  private

  def search_location
    params.permit(:location)
  end
end
