class CreateCarManufactories < ActiveRecord::Migration[5.0]
  def change
    create_table :car_manufactories do |t|
      t.string :make

      t.timestamps
    end
  end
end
