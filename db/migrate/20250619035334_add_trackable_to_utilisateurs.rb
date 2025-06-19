class AddTrackableToUtilisateurs < ActiveRecord::Migration[7.2]
  def change
    add_column :utilisateurs, :sign_in_count,      :integer, default: 0, null: false
    add_column :utilisateurs, :current_sign_in_at, :datetime
    add_column :utilisateurs, :last_sign_in_at,    :datetime
    add_column :utilisateurs, :current_sign_in_ip, :string
    add_column :utilisateurs, :last_sign_in_ip,    :string
  end
end
