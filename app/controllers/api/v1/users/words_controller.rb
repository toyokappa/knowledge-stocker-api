class Api::V1::Users::WordsController < Api::V1::ApplicationController
  before_action :set_user

  def index
    render json: @user.words.order(created_at: :desc).as_json(methods: :understood)
  end

  def create
    @user.words.create!(word_params)
    render json: @user.words.order(created_at: :desc).as_json(methods: :understood)
  end

  def destroy
    @user.words.find(params[:id]).destroy!
    render json: @user.words.order(created_at: :desc).as_json(methods: :understood)
  end

  private

    def set_user
      @user = User.find_by!(name: params[:user_name])
    end

    def word_params
      params.permit(:text)
    end
end
