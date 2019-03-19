class Word < ApplicationRecord
  belongs_to :user, inverse_of: :words
  has_many :knowledges, inverse_of: :word, dependent: :destroy

  scope :with_understood, -> { joins(:knowledges).group(:id) }

  def understood
    knowledges.present?
  end
end
