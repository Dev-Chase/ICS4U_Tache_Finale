class RemoveSourceUtilisateurFromNotifications < ActiveRecord::Migration[7.2]
  def change
    remove_reference :notifications, :source_utilisateur
  end
end
