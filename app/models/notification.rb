class Notification < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :source_utilisateur, class_name: "Utilisateur"
  belongs_to :publication, optional: true
  belongs_to :commentaire, optional: true
end
