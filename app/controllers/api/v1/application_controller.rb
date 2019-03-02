class Api::V1::ApplicationController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_v1_user!

  protected

    def current_user
      current_api_v1_user
    end
end
