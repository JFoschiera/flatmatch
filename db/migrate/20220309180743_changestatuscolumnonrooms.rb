class Changestatuscolumnonrooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :status
    add_column :rooms, :status, :string
  end
end
