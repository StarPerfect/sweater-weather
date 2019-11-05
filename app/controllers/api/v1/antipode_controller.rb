class Api::V1::AntipodeController < ApplicationController
  def index
    google = GoogleApiService.new
    amypode = AmypodeApiService.new(google.latitude({address: search_location}), google.longitude({address: search_location}))
    antipode_city = google.get_city({ latlng: "#{amypode.lat},#{amypode.long}" })
    darksky = DarkskyApiService.new(amypode.lat, amypode.long)
    antipode = AntipodeFacade.new(search_location, antipode_city, darksky.response)
    render json: AntipodeSerializer.new(antipode)
  end

  private

  def search_location
    params.permit(:location)
  end
end
