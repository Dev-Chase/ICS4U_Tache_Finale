# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts("Emptying Database")
Rake::Task['db:truncate_all'].invoke

puts("Seeding Database")
require("faker")

# Utilisateurs
20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Utilisateur.create(surnom: "#{first_name}#{last_name[0]}", prenom: first_name, age: rand(18..30), email: "#{first_name.downcase}.#{last_name.downcase}@gmail.com", bio: Faker::ChuckNorris.fact, password: "testing", password_confirmation: "testing")
end

# Amis (faire en sorte que deux utilisateurs sont amis avec une moitié des utilisateurs)
utilisateurs_ids = Utilisateur.pluck(:id)
utilisateur_a = utilisateurs_ids.delete_at(0)
utilisateur_b = utilisateurs_ids.delete_at(0)
premier_motie = utilisateurs_ids[0...(utilisateurs_ids.length / 2)]
deuxieme_motie = utilisateurs_ids[(utilisateurs_ids.length / 2)..-1]
premier_motie.each do |utilisateur_id|
  Ami.create(utilisateur_1_id: utilisateur_a, utilisateur_2_id: utilisateur_id)
end
deuxieme_motie.each do |utilisateur_id|
  Ami.create(utilisateur_1_id: utilisateur_b, utilisateur_2_id: utilisateur_id)
end

# Publications
pictures = %w[cat.jpeg dog.jpg mouse.jpeg parrot.jpeg]
file_paths = pictures.map{|path| Rails.root.join("db", "images", path)}.collect.to_a
5.times do
  Publication.create(utilisateur_id: utilisateur_a, caption: Faker::ChuckNorris.fact, media: File.open(file_paths.sample))
  Publication.create(utilisateur_id: utilisateur_b, caption: Faker::ChuckNorris.fact, media: File.open(file_paths.sample))
end
# NOTE: seed task halts with too many uploaded files
# 7.times do
#   Publication.create(utilisateur_id: utilisateur_b, caption: Faker::ChuckNorris.fact, media: File.open(file_paths.sample))
# end
# 5.times do 
#   Publication.create(utilisateur_id: utilisateurs_ids.sample, caption: Faker::ChuckNorris.fact, media: File.open(file_paths.sample))
# end

# Commentaires
30.times do
  Commentaire.create(utilisateur_id: utilisateurs_ids.sample, publication_id: Publication.pluck(:id).sample, contenue: Faker::ChuckNorris.fact)
end

# Likes
publications = Publication.all.to_a.shuffle.pluck(:id)
publications_a = publications[0...(publications.length / 2)]
publications_b = publications[(publications.length / 2)..-1]
publications_a.length.times do |i|
  Like.create(utilisateur_id: utilisateur_a, publication_id: publications_a[i])
  Like.create(utilisateur_id: utilisateur_b, publication_id: publications_b[i])
end

# Signalements
publications = Publication.all.to_a.shuffle.pluck(:id)
publications = publications[0...publications.length/3]
publications.each do |pub|
  Signalement.create(utilisateur_id: Utilisateur.pluck(:id).sample, publication_id: pub, raison: Faker::ChuckNorris.fact, etat: "non-résolu")
end

# Utilisateur Dossiers
names = %w[Favoris Interessant Bizarre]
names.each do |name|
  UtilisateurDossier.create(utilisateur_id: utilisateur_a, nom: name)
  UtilisateurDossier.create(utilisateur_id: utilisateur_b, nom: name)
end

# Enregistrements (Enregistres, oops typo)
publications = Publication.all.to_a.shuffle.pluck(:id)
utilisateur_dossiers_a = UtilisateurDossier.where(utilisateur_id: utilisateur_a).pluck(:id)
utilisateur_dossiers_b = UtilisateurDossier.where(utilisateur_id: utilisateur_b).pluck(:id)
publications_a = publications[0...(publications.length / 2)]
publications_b = publications[(publications.length / 2)..-1]
12.times do
  Enregistre.create(utilisateur_dossier_id: utilisateur_dossiers_a.sample, publication_id: publications_a.sample)
  Enregistre.create(utilisateur_dossier_id: utilisateur_dossiers_a.sample, publication_id: publications_b.sample)
end
