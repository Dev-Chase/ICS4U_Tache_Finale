class Commentaire < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :publication

  def information
    "Postulé par #{utilisateur.surnom} à #{created_at} sur #{publication.description}"
  end
end
