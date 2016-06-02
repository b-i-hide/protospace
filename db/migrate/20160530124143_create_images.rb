class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image
      t.integer :status
      t.references :prototype, index: true, foreign_key: true

      t.timestamps
    end
  end
end
