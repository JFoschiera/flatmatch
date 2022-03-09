class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :roommates
      t.integer :size
      t.string :address
      t.string :city
      t.date :start_date
      t.date :end_date
      t.string :pets
      t.string :smoking
      t.string :visitors
      t.text :description
      t.integer :floor
      t.integer :price
      t.integer :status
      t.string :utilities

      t.timestamps
    end
  end
end
