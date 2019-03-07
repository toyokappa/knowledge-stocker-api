class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :authorize_request, only: :create

  def new
    render json: "ok"
  end

  def create
    user = User.find_by(email: params[:email])
    return render json: { errors: "unauthorized" }, status: :unauthorized unless user&.authenticate(params[:password])

    token = JsonWebToken.encode(user_id: user.id)
    render json: { authToken: token }
  end
end
