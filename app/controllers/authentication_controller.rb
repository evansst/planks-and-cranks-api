class AuthenticationController < ApplicationController

  def login
    @user = User.find_by(username: params[:username])

    if !@user || !@user.authenticate(params[:password])
      render json: { message: 'Something is wrong with your Username or Password' }, status: :unauthorized
    else
      token = JWT.encode(
        { user_id: @user.id },
        'some special secret string'
      )

      render json: { user: @user, token: token }, status: :ok
    end
  end
end
