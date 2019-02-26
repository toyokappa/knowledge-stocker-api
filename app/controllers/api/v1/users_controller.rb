class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    render json: 'hellow world'
  end
end
