class AntipodeFacade
  attr_reader :id

  def initialize(search, antipode, forecast)
    @id = 11
    @type = 'antipode'
    @search = search
    @antipode = antipode[:results][0][:address_components][2][:long_name]
    @forecast = forecast
    @attributes = {}
  end

  def forecast
    @forecast.map do |data|
      AntipodeForecast.new(data)
    end
    binding.pry
  end

  def search_location
    binding.pry
  end

end
