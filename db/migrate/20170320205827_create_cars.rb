class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :comfort
      t.string :color
      t.integer :number_seats
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
