class CreateSignalements < ActiveRecord::Migration[7.2]
  def change
    create_table :signalements do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.references :publication, null: true, foreign_key: true
      t.references :commentaire, null: true, foreign_key: true
      t.text :raison
      t.string :etat

      t.timestamps
    end
  end
end
