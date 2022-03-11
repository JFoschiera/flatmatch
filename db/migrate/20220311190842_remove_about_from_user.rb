class RemoveAboutFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :about
  end
end
