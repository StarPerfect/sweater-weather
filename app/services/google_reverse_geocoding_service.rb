class GoogleReverseGeocodingService
  def get_city(latitude, longitude)
    response = connection(latitude, longitude).get('maps/api/geocode/json')
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection(latitude, longitude)
    Faraday.new(
      url: 'https://maps.googleapis.com/',
      params: { latlng: "#{latitude},#{longitude}",
                key: ENV['GOOGLE_API_KEY']
              }
      )
  end
end
