class Publication < ApplicationRecord
  belongs_to :utilisateur
  has_many :commentaires, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :enregistres, dependent: :destroy
  has_many :signalements, dependent: :destroy

  has_one_attached :media

  def description 
    "Crée par #{utilisateur.surnom} à #{created_at}"
  end
end
