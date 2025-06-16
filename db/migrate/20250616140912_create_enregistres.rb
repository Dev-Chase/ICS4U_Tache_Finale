class CreateEnregistres < ActiveRecord::Migration[7.2]
  def change
    create_table :enregistres do |t|
      t.references :utilisateur_dossier, null: false, foreign_key: true
      t.references :publication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
