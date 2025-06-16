class CreatePublications < ActiveRecord::Migration[7.2]
  def change
    create_table :publications do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.text :caption

      t.timestamps
    end
  end
end
