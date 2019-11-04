class HourlyForecast
  attr_reader :datetime, :icon, :temperature

  def initialize(details = {})
    @datetime = Time.at(details[:time])
    @icon = details[:icon]
    @temperature = details[:temperature]
  end
end
