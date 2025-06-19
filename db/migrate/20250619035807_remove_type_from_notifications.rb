class RemoveTypeFromNotifications < ActiveRecord::Migration[7.2]
  def change
    remove_column :notifications, :type, :string
  end
end
