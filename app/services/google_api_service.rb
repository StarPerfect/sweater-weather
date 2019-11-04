class GoogleApiService
  def latitude(location)
    get_json(location)[:results][0][:geometry][:location][:lat]
  end

  def longitude(location)
    get_json(location)[:results][0][:geometry][:location][:lng]
  end

  def country_location(location)
    get_json(location)[:results][0][:formatted_address]
  end

  def get_city(location)
    response = connection(location).get('maps/api/geocode/json')
    JSON.parse(response.body, symbolize_names: true)
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
