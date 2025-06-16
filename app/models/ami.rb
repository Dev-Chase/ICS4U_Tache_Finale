class Ami < ApplicationRecord
  belongs_to :utilisateur_1, class_name: "Utilisateur"
  belongs_to :utilisateur_2, class_name: "Utilisateur"
end
