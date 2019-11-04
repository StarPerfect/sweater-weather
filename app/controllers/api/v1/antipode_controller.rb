class Api::V1::AntipodeController < ApplicationController
  def index
    geocoding = GoogleApiService.new
    amypode = AmypodeApiService.new(geocoding.latitude(search_location), geocoding.longitude(search_location))
    find_city = GoogleReverseGeocodingService.new
    antipode_city = find_city.get_city(amypode.get_antipode[:data][:attributes][:lat], amypode.get_antipode[:data][:attributes][:long])
    darksky = DarkskyApiService.new(amypode.get_antipode[:data][:attributes][:lat], amypode.get_antipode[:data][:attributes][:long])
    antipode = AntipodeFacade.new(search_location, antipode_city, darksky.response)
    render json: AntipodeSerializer.new(antipode)
  end

  private

  def search_location
    params.permit(:location)
  end
end
