class CreateUtilisateurDossiers < ActiveRecord::Migration[7.2]
  def change
    create_table :utilisateur_dossiers do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.string :nom

      t.timestamps
    end
  end
end
