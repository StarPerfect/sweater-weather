class CurrentForecast
  attr_reader :summary, :icon, :temperature, :feels_like, :location, :datetime, :high, :low, :humidity, :visibility, :uv_index

  def initialize(location, details = {})
    @summary = details[:currently][:summary]
    @icon = details[:currently][:icon]
    @temperature = details[:currently][:temperature]
    @feels_like = details[:currently][:apparentTemperature]
    @location = location
    @datetime = Time.at(details[:currently][:time])
    @high = details[:daily][:data][0][:temperatureHigh]
    @low = details[:daily][:data][0][:temperatureLow]
    @humidity = details[:currently][:humidity]
    @visibility = details[:currently][:visibility]
    @uv_index = details[:currently][:uvIndex]
  end
end
