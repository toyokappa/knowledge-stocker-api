class Knowledge < ApplicationRecord
  belongs_to :word, inverse_of: :knowledges
end
