class Word < ApplicationRecord
  belongs_to :user, inverse_of: :words
  has_many :knowledges, inverse_of: :word, dependent: :destroy

  def understood
    knowledges.present?
  end
end
