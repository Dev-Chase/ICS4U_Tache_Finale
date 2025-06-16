class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.references :publication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
