class AmypodeApiService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def get_antipode
    response = connection.get('/api/v1/antipodes')
    JSON.parse(response.body, symbolize_names: true)
  end

  def lat
    get_antipode[:data][:attributes][:lat]
  end

  def long
    get_antipode[:data][:attributes][:long]
  end

  private

  def connection
    Faraday.new(
    url: 'http://amypode.herokuapp.com/',
    headers: {api_key: ENV['AMYPODE_API_KEY']},
    params: {lat: @latitude, long: @longitude}
    )
  end
end
