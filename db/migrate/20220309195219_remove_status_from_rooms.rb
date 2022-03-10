class RemoveStatusFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :status
  end
end
