class AntipodeFacade
  attr_reader :id

  def initialize(search, antipode, forecast)
    @id = 11
    @type = 'antipode'
    @search_location = search[:location]
    @location_name = antipode[:results][0][:address_components][2][:long_name]
    @forecast = AntipodeForecast.new(forecast)
  end
end
