json.extract! utilisateur, :id, :surnom, :prenom, :age, :email, :bio, :created_at, :updated_at
json.url utilisateur_url(utilisateur, format: :json)
