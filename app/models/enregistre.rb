class Enregistre < ApplicationRecord
  belongs_to :utilisateur_dossier
  belongs_to :publication
end
