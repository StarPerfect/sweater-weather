class Api::V1::AntipodeController < ApplicationController
  def index
    geocoding = GoogleApiService.new
    amypode = AmypodeApiService.new(geocoding.latitude({address: search_location}), geocoding.longitude({address: search_location}))
    find_city = GoogleApiService.new
    antipode_city = find_city.get_city({ latlng: "#{amypode.lat},#{amypode.long}" })
    darksky = DarkskyApiService.new(amypode.lat, amypode.long)
    antipode = AntipodeFacade.new(search_location, antipode_city, darksky.response)
    render json: AntipodeSerializer.new(antipode)
  end

  private

  def search_location
    params.permit(:location)
  end
end
