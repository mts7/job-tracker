class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string :title
      t.integer :version
      t.string :location
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
