class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :name, limit: 128, null: false
      t.text :value, null: false

      t.timestamps
    end
  end
end
