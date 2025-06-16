class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.references :source_utilisateur, null: false, foreign_key: { to_table: :utilisateurs }
      t.references :publication, null: true, foreign_key: true
      t.references :commentaire, null: true, foreign_key: true
      t.string :type
      t.boolean :lu

      t.timestamps
    end
  end
end
