class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.references :person, null: false, foreign_key: true
      t.string :ddd, limit: 3, null: false
      t.string :number, limit: 9, null: false
      t.integer :type, null: false
      t.boolean :preferential, null: false

      t.timestamps
    end
  end
end
