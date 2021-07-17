class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :headquarters
      t.references :industry, null: false, foreign_key: true
      t.string :website

      t.timestamps
    end
  end
end
