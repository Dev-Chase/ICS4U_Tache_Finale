class Utilisateur < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :utilisateur_dossiers, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :commentaires, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :enregistres, through: :utilisateur_dossiers
  has_many :notifications, dependent: :destroy
  has_many :signalements, dependent: :destroy

  # User relationships
  has_many :amis_as_user1, class_name: "Ami", foreign_key: "utilisateur_1_id", dependent: :destroy
  has_many :amis_as_user2, class_name: "Ami", foreign_key: "utilisateur_1_id", dependent: :destroy

  def amis
    Amis.where("utilisateur_1_id = ? OR utilisateur_2_id = ?", self.id, self.id)
  end

  def connected_utilisateurs
    amis.map do |ami|
      ami.utilisateur_1 == self ? ami.utilisateur_2 : ami.utilisateur_1
    end
  end
end
