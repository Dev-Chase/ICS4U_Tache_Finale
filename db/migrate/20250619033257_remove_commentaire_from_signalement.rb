class RemoveCommentaireFromSignalement < ActiveRecord::Migration[7.2]
  def change
    remove_reference :signalements, :commentaire, null: false, foreign_key: true
  end
end
