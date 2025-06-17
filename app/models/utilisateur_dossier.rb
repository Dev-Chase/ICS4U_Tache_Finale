class UtilisateurDossier < ApplicationRecord
  belongs_to :utilisateur
  has_many :enregistres, dependent: :destroy

  def information
    return "#{utilisateur.surnom} - #{nom}"
  end
end
