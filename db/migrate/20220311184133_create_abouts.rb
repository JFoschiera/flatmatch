class CreateAbouts < ActiveRecord::Migration[6.1]
  def change
    create_table :abouts do |t|
      t.text :about_user
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
