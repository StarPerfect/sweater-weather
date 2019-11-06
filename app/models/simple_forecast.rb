class SimpleForecast
  attr_reader :summary, :current_temperature

    def initialize(details = {})
      @summary = details[:currently][:summary]
      @temperature = details[:currently][:temperature]
    end
end
