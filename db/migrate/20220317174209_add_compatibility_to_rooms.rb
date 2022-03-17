class AddCompatibilityToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :compatibility, :integer, default: 0
  end
end
