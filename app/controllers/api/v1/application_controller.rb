class Api::V1::ApplicationController < ApplicationController
  before_action :authorize_request
  
  # NOTE: attr_accessorとbefore_actionの相性が悪いため
  #       setterはインスタンス変数を使用
  attr_reader :current_user
  
  protected

    def authorize_request
      token = request.headers["Authorization"]&.split(" ")&.last
      return render json: { errors: "No token" }, status: :unauthorized unless token

      payload = JsonWebToken.decode(token)
      return render json: { errors: "Invalid token" }, status: :unauthorized unless payload

      @current_user = User.find_by(id: payload[:user_id])
      return render json: { errors: "Record not found" }, status: :unauthorized unless @current_user
    end
end
