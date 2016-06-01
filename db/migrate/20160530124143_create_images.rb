class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :prototype_id
      t.text :image
      t.integer :status
      t.references :prototype, index: true, foreign_keys: true

      t.timestamps
    end
  end
end
