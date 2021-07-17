class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :company, null: false, foreign_key: true
      t.string :description_link
      t.decimal :salary_low
      t.decimal :salary_high
      t.decimal :pto_days
      t.boolean :remote
      t.datetime :listed_at

      t.timestamps
    end
  end
end
