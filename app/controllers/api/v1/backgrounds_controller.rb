class Api::V1::BackgroundsController < ApplicationController
  def index
    unsplash = UnsplashService.new
    render json: BackgroundsFacade.new(unsplash.get_image(location))
  end

  private

  def location
    params.permit(:location)
  end
end
