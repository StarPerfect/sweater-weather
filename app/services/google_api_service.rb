class GoogleApiService
  attr_reader :latitude, :longitude, :country_location

  def initialize(location)
    @latitude = get_json(location)[:results][0][:geometry][:location][:lat]
    @longitude = get_json(location)[:results][0][:geometry][:location][:lng]
    @country_location = get_json(location)[:results][0][:formatted_address]
  end

  private

  def get_json(location)
    conn = Faraday.new(
      url: 'https://maps.googleapis.com/',
      params: { address: location,
                key: ENV['GOOGLE_API_KEY']
              }
      )
    response = conn.get('maps/api/geocode/json')
    JSON.parse(response.body, symbolize_names: true)
  end
end
