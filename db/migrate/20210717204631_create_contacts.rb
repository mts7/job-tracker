class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :company, null: false, foreign_key: true
      t.string :job_title
      t.references :contact_position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
