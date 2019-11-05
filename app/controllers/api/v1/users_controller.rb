class Api::V1::UsersController < ApplicationController
  # POST /users
  def create
    @user = User.new(user_params)
binding.pry
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
