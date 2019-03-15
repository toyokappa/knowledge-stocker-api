class Knowledge < ApplicationRecord
  belongs_to :word, inverse_of: :knowledges

  scope :order_understanding_desc, -> { order(understanding: :desc, updated_at: :desc) }
end
