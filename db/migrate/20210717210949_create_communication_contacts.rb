class CreateCommunicationContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :communication_contacts do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :communication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
