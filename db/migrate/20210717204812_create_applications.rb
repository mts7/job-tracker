class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.references :resume, null: false, foreign_key: true
      t.references :communication, null: false, foreign_key: true
      t.datetime :deadline
      t.datetime :applied_at

      t.timestamps
    end
  end
end
