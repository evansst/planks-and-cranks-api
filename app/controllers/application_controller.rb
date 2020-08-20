class ApplicationController < ActionController::API

  def authenticate
    login(auth_header(request))
  end

  private

  def auth_header(request)
    auth_header = request.headers['Authorization']

    unless auth_header
      render json: { message: 'You need a token' }, status: :forbidden
    end
  end
  
  def login(auth_header)
    begin
      decoded_token = JWT.decode(
        auth_header.split(' ')[1],
        'some special secret string'
      )

      user_id = decoded_token.first['user_id']
      @user = User.find(user_id)
    rescue
      render json: { message: "Tsk tsk, that's not your token!" }, status: :forbidden
    end
  end
end
