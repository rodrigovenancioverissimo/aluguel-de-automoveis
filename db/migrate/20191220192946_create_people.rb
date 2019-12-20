class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name, limit: 32, null: false
      t.string :surname, limit: 256, null: false
      t.string :cpf, limit: 11, null: false
      t.date :date_of_birth, null: false
      t.string :email, limit: 256, null: false

      t.timestamps
    end
  end
end
