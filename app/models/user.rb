class User < ApplicationRecord
  # Include default devise modules.
  # :confirmable, :rememberable, :recoverable, :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
