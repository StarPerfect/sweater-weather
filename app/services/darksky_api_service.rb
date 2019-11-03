class DarkskyApiService
  def initialize(lat, lng)
    @latitude = lat
    @longitude = lng
  end

  def response
    json_data = conn.get("/forecast/#{ENV['DARKSKY_API_KEY']}/#{@latitude},#{@longitude}")
    JSON.parse(json_data.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.darksky.net/')
  end
end
