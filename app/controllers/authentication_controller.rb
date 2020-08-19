class AuthenticationController < ApplicationController

  def login
    @user = User.find_by(username: params[:username])

    if !@user || !user.authenticate(params[:password])
      render json: { message: 'Something is wrong with your Username or Password' }, status: :unauthorized
    else
      render json: { user: @user }
    end
  end
end
