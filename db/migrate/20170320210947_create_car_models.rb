class CreateCarModels < ActiveRecord::Migration[5.0]
  def change
    create_table :car_models do |t|
      t.string :model

      t.timestamps
    end
  end
end
