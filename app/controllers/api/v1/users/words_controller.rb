class Api::V1::Users::WordsController < Api::V1::ApplicationController
  def index
    user = User.find_by!(name: params[:user_name])
    words = user.words
    render json: words
  end
end
