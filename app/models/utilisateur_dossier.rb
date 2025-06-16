class UtilisateurDossier < ApplicationRecord
  belongs_to :utilisateur
  has_many :enregistres, dependent: :destroy
end
