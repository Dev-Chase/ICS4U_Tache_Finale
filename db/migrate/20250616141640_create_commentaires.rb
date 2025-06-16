class CreateCommentaires < ActiveRecord::Migration[7.2]
  def change
    create_table :commentaires do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.references :publication, null: false, foreign_key: true
      t.text :contenue

      t.timestamps
    end
  end
end
