class RemoveHeartFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :heart
  end
end
