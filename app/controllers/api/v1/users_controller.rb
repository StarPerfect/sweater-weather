class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if user_params[:password] == user_params[:password_confirmation] && @user.save
      render json: UserSerializer.new(@user), status: 201
    else
      render json: 'Invalid email or password', status: 418
    end
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
