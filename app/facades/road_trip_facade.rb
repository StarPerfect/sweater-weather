class RoadTripFacade
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
    
  end
end
