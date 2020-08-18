class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: { users: @users }
  end

  # GET /users/1
  def show
    if @user.avatar.attached?
      render json: { user: @user, avatar_url: url_for(@user.avatar) }
    else
      render json: { user: @user }
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save!
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      @user.avatar.attach(user_params[:avatar])
      render json: { user: @user, avatar_url: url_for(@user.avatar) }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :username, :password, :email_address, :avatar)
    end
end
