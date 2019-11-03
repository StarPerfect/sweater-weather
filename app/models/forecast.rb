class Forecast < ApplicationRecord
  attr_reader

  def initialize(location, details = {})
    @current_summary = details[:currently][:summary]
    @current_icon = details[:currently][:icon]
    @current_temp = details[:currently][:temperature]
    @feels_like = details[:currently][:apparentTemperature]
    @location = location
    @datetime = Time.at(dark_parsed[:currently][:time]
    @high = details[:daily][:data][0][:temperatureHigh]
    @low = details[:daily][:data][0][:temperatureLow]
    @humidity = details[:daily][:data][0][:humidity]
    @visibility = details[:daily][:data][0][:visibility]
    @uv_index = details[:daily][:data][0][:uvIndex]
  end
end
