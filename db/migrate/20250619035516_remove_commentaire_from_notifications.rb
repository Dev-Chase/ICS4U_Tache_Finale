class RemoveCommentaireFromNotifications < ActiveRecord::Migration[7.2]
  def change
    remove_reference :notifications, :commentaire, null: false, foreign_key: true
  end
end
