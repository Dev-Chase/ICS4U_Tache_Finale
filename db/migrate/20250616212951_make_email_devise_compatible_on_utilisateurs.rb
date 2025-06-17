class MakeEmailDeviseCompatibleOnUtilisateurs < ActiveRecord::Migration[7.2]
  def change
    change_column :utilisateurs, :email, :string, null: false, default: ""
  end
end
