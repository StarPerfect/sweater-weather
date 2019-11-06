class Api::V1::RoadtripController < ApplicationController
  def index
    user = User.find_by(api_key: trip_details[:api_key])
    if user != nil
      trip = RoadTripFacade.new(trip_details[:origin], trip_details[:destination])
      render json: RoadTripSerializer.new(trip), status: 200
    else
      render json: 'Unauthorized', status: 401
    end

  end

  protected

  def trip_details
    params.permit(:origin, :destination, :api_key)
  end
end
