class Api::V1::ForecastController < ApplicationController
  def index
    geocoding_conn = Faraday.new(
      url: 'https://maps.googleapis.com/',
      params: { address: 'Denver, CO',
                key: ENV['GOOGLE_API_KEY']
              }
      )

    geo_response = geocoding_conn.get('maps/api/geocode/json')

    parsed = JSON.parse(geo_response.body, symbolize_names: true)

    @latitude = parsed[:results][0][:geometry][:location][:lat]
    @longitude = parsed[:results][0][:geometry][:location][:lng]

    darksky_conn = Faraday.new(url: 'https://api.darksky.net/')

    darksky_response = darksky_conn.get("/forecast/#{ENV['DARKSKY_API_KEY']}/#{@latitude},#{@longitude}")

  end
end
