class RoadTripFacade
  attr_reader :id, :origin, :destination

  def initialize(origin, destination)
    @id = 27
    @origin = origin
    @destination = destination
  end

  def travel_time_in_minutes
    direction_data = GoogleApiService.new({origin: @origin, destination: @destination}, 'directions')
    direction_data.location[:routes][0][:legs][0][:duration][:value]
  end

  def arrival_forecast
    darksky = DarkskyApiService.new(destination_lat, destination_long)
    arrival_time = Time.now.to_i + travel_time_in_minutes
    SimpleForecast.new(darksky.future(arrival_time))
  end

  protected

  def destination_lat
    geocoding = GoogleApiService.new({address: @destination}, 'geocode')
    geocoding.latitude
  end

  def destination_long
    geocoding = GoogleApiService.new({address: @destination}, 'geocode')
    geocoding.longitude
  end
end
