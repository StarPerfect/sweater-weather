class Api::V1::AntipodeController < ApplicationController
  def index
    geocoding = GoogleApiService.new({address: search_location})
    amypode = AmypodeApiService.new(geocoding.latitude, geocoding.longitude)
    antipode_city = GoogleApiService.new({ latlng: "#{amypode.lat},#{amypode.long}" })
    darksky = DarkskyApiService.new(amypode.lat, amypode.long)
    antipode = AntipodeFacade.new(search_location, antipode_city, darksky.response)
    render json: AntipodeSerializer.new(antipode)
  end

  private

  def search_location
    params.permit(:location)
  end
end
