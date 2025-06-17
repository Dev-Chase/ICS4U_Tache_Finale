json.extract! notification, :id, :utilisateur_id, :source_utilisateur_id, :publication_id, :commentaire_id, :type, :lu, :created_at, :updated_at
json.url notification_url(notification, format: :json)
