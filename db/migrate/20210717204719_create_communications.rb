class CreateCommunications < ActiveRecord::Migration[6.1]
  def change
    create_table :communications do |t|
      t.boolean :contact_initiated
      t.datetime :contacted_at
      t.references :job, null: false, foreign_key: true
      t.references :communication_reason, null: false, foreign_key: true
      t.text :notes
      t.references :communication_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
