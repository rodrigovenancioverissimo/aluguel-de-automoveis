class CreateLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :licenses do |t|
      t.references :person, null: false, foreign_key: true
      t.string :number, limit: 11, null: false
      t.date :validity, null: false

      t.timestamps
    end
  end
end
