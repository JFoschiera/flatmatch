class CreateCompatibilities < ActiveRecord::Migration[6.1]
  def change
    create_table :compatibilities do |t|
      t.integer  "user1_id"
      t.integer  "user2_id"
      t.integer  "result"
      t.timestamps
    end

    add_index "compatibilities", ["user1_id"], name: "index_compatibilities_on_user1_id", using: :btree
    add_index "compatibilities", ["user2_id"], name: "index_compatibilities_on_user2_id", using: :btree
  end
end
