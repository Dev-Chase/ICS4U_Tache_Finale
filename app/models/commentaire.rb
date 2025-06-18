class Commentaire < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :publication
  has_many :signalements, dependent: :destroy

  def information
    "Postulé par #{utilisateur.surnom} à #{created_at} sur #{publication.description}"
  end
end
