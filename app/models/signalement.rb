class Signalement < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :publication, optional: true
  belongs_to :commentaire, optional: true
end
