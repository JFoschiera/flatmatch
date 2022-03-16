class RenameMatchsToLikes < ActiveRecord::Migration[6.1]
  def change
    rename_table :matchs, :likes
    add_column :likes, :confirm, :boolean, :default => false
    remove_column :likes, :like
  end
end
