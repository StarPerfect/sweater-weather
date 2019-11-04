class AmypodeApiService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  # private

  def get_antipode(lat, lng)
    conn = Faraday.new(
    url: 'http://amypode.herokuapp.com/',
    headers: {api_key: ENV['AMYPODE_API_KEY']},
    params: {lat: lat, long: lng}
    )
    binding.pry
    response = conn.get('/api/v1/antipodes')
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
