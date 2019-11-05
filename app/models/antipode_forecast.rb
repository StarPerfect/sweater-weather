class AntipodeForecast
  attr_reader :summary, :current_temperature

    def initialize(details = {})
      @summary = details[:currently][:summary]
      @current_temperature = details[:currently][:temperature]
    end
end
