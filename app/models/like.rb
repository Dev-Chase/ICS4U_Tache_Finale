class Like < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :publication
end
