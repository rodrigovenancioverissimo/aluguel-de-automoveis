class CreateModalities < ActiveRecord::Migration[6.0]
  def change
    create_table :modalities do |t|
      t.references :license, null: false, foreign_key: true
      t.integer :name, null: false

      t.timestamps
    end
  end
end
