class AntipodeFacade
  attr_reader :id, :type, :location_name, :forecast, :search_location

  def initialize(search, antipode, forecast)
    @id = 11
    @type = 'antipode'
    @location_name = antipode.location[:results][0][:address_components][2][:long_name]
    @forecast = SimpleForecast.new(forecast)
    @search_location = search[:location]
  end
end
