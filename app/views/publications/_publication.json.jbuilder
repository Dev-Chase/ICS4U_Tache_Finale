json.extract! publication, :id, :utilisateur_id, :caption, :created_at, :updated_at
json.url publication_url(publication, format: :json)
