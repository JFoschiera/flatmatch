class RemoveResultFromCompatibilities < ActiveRecord::Migration[6.1]
  def change
    remove_column :compatibilities, :result
  end
end
