class Api::V1::WordsController < Api::V1::ApplicationController
  def index
    user = User.find(params[:user_id])
    words = user.words
    render json: words
  end
end
