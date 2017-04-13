class AddColumnsToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_manufactory_id, :integer
    add_column :cars, :car_model_id, :integer
  end
end
