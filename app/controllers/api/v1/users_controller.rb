class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    user.save!(user_params)
    token = JsonWebToken.encode(user_id: user.id)
    render json: { authToken: token, userName: user.name }
  end

  private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
