class AddUserToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :user, index: true
  end
end
