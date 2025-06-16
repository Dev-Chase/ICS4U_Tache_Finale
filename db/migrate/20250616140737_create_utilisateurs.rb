class CreateUtilisateurs < ActiveRecord::Migration[7.2]
  def change
    create_table :utilisateurs do |t|
      t.string :surnom
      t.string :prenom
      t.integer :age
      t.string :email
      t.text :bio

      t.timestamps
    end
  end
end
