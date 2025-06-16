class CreateAmis < ActiveRecord::Migration[7.2]
  def change
    create_table :amis do |t|
      t.references :utilisateur_1, null: false, foreign_key: { to_table: :utilisateurs }
      t.references :utilisateur_2, null: false, foreign_key: { to_table: :utilisateurs }
      t.string :status

      t.timestamps
    end
  end
end
