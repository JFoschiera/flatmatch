class Addcolumntorooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :heart, :boolean
end
