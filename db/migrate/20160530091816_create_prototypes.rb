class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.text :concept
      t.text :chatch_copy
      t.integer :likes_count
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
