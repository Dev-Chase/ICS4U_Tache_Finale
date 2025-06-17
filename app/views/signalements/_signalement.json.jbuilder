json.extract! signalement, :id, :utilisateur_id, :publication_id, :commentaire_id, :raison, :etat, :created_at, :updated_at
json.url signalement_url(signalement, format: :json)
