class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :authorize_request, only: :create
  
  def index
    render json: User.all
  end

  def create
    User.create!(user_params)
    render json: "ok"
  end
  
  private
  
    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end
end
