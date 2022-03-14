class RemovePhoneFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :phone
  end
end
