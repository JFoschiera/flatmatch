class AddLikeToCompatibilities < ActiveRecord::Migration[6.1]
  def change
    add_reference :compatibilities, :like, null: false, foreign_key: true
  end
end
