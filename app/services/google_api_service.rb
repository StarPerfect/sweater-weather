class GoogleApiService
  attr_reader :location
  
  def initialize(location)
    @location = get_json(location)
  end

  def latitude
    @location[:results][0][:geometry][:location][:lat]
  end

  def longitude
    @location[:results][0][:geometry][:location][:lng]
  end

  def country_location
    @location[:results][0][:formatted_address]
  end


  private

  def get_json(location)
    response = connection(location).get('maps/api/geocode/json')
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection(location)
    Faraday.new(
      url: 'https://maps.googleapis.com/',
      params: { key: ENV['GOOGLE_API_KEY']
      }.merge(location)
    )
  end
end
