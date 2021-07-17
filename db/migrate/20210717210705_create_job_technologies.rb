class CreateJobTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :job_technologies do |t|
      t.references :job, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
