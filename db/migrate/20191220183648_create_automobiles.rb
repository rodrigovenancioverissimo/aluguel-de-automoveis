class CreateAutomobiles < ActiveRecord::Migration[6.0]
  def change
    create_table :automobiles do |t|
      t.string :model, limit: 128, null: false
      t.integer :color, null: false
      t.integer :year, limit: 9999, null: false
      t.integer :automobile_type, null: false
      t.string :plaque, limit: 7, null: false
      t.decimal :daily_cost, precision: 7, scale: 2, null: false

      t.timestamps
    end
  end
end
