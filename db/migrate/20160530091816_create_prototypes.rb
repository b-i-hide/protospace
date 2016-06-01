class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.text :concept
      t.text :catch_copy
      t.references :user, index: true, foreign_keys: true

      t.timestamps
    end
  end
end
