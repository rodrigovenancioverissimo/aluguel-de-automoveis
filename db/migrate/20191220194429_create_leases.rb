class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.references :person, null: false, foreign_key: true
      t.references :automobile, null: false, foreign_key: true
      t.timestamp :start_time, null: false
      t.timestamp :end_time
      t.timestamp :entry_time
      t.timestamp :exit_time

      t.timestamps
    end
  end
end
