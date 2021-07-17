class CreateCommunicationReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :communication_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
