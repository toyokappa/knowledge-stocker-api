class User < ApplicationRecord
  has_secure_password

  has_many :words, inverse_of: :user, dependent: :nullify

  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true
  validates :email,    format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true }
  validates :password, length: { minimum: 6, allow_blank: true }
end
