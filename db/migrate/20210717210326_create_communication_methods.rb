class CreateCommunicationMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :communication_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end
