class Word < ApplicationRecord
  belongs_to :user, inverse_of: :words
end
