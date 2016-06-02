class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.text :concept
      t.text :catch_copy
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
