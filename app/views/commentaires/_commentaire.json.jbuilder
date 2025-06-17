json.extract! commentaire, :id, :utilisateur_id, :publication_id, :contenue, :created_at, :updated_at
json.url commentaire_url(commentaire, format: :json)
