class DailyForecast
  attr_reader :datetime, :high, :low, :precip_probability, :precip_type, :icon
  
  def initialize(details = {})
    @datetime = Time.at(details[:time])
    @high = details[:temperatureHigh]
    @low = details[:temperatureLow]
    @precip_probability = details[:precipProbability]
    @precip_type = details[:precipType]
    @icon = details[:icon]
  end
end
