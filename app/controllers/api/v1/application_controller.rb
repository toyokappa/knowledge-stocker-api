class Api::V1::ApplicationController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_token do |token, _|
      @user = User.find_by(auth_token: token)
      @user.present?
    end
  end
end
