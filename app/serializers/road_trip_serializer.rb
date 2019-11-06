class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :travel_time_in_seconds, :arrival_forecast
end
