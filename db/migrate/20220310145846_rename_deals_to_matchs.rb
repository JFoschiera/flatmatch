class RenameDealsToMatchs < ActiveRecord::Migration[6.1]
  def change
    rename_table :deals, :matchs
    add_column :matchs, :like, :boolean, :default => false
  end
end
