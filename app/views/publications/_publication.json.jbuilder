json.extract! publication, :id, :utilisateur_id, :caption, :date_publiee, :created_at, :updated_at
json.url publication_url(publication, format: :json)
