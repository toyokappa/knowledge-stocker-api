class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :authorize_request, only: :create

  def show
    render json: { userName: current_user.name }
  end

  def create
    user = User.find_or_create_from_auth_params(auth_params)
    token = JsonWebToken.encode(user_id: user.uid)
    render json: { authToken: token, userName: user.name }
  end

  private

    def auth_params
      params.permit(:uid, :name, :email, :imageUrl)
    end
end
