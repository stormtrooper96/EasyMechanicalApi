# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  skip_before_action :authorize_request, only: :create
  def index #controlado por el GET
      @users = User.all
      render json: @users, status: :ok
  end
  def show
    @user = User.find(params[:id])
    json_response({"user": @user}) #objeto dentro de objeto, @user.rol nos permite mostrar la relación con rol
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :status_id,
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end

