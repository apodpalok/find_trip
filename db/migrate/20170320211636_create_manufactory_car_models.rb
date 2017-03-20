class CreateManufactoryCarModels < ActiveRecord::Migration[5.0]
  def change
    create_table :manufactory_car_models do |t|
      t.integer :car_manufactory_id
      t.integer :car_model_id

      t.timestamps
    end
  end
end
