class Api::V1::ForecastController < ApplicationController
  def index
    location = 'Denver, CO'

    geocoding_conn = Faraday.new(
      url: 'https://maps.googleapis.com/',
      params: { address: location,
                key: ENV['GOOGLE_API_KEY']
              }
      )

    geo_response = geocoding_conn.get('maps/api/geocode/json')

    parsed = JSON.parse(geo_response.body, symbolize_names: true)

    @latitude = parsed[:results][0][:geometry][:location][:lat]
    @longitude = parsed[:results][0][:geometry][:location][:lng]
    @country_location = parsed[:results][0][:formatted_address]

    darksky_conn = Faraday.new(url: 'https://api.darksky.net/')

    darksky_response = darksky_conn.get("/forecast/#{ENV['DARKSKY_API_KEY']}/#{@latitude},#{@longitude}")

    dark_parsed = JSON.parse(darksky_response.body, symbolize_names: true)

    CurrentForecast.new(@country_location, dark_parsed)
  end
end
