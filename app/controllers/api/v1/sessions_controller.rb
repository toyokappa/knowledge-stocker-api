class Api::V1::SessionsController < Api::V1::ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_by(email: params[:email], password: params[:password])
    return render json: "no user" unless user

    render json: user.auth_token
  end
end
