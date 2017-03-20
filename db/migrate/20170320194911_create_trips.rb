class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :start_location
      t.string :finish_location
      t.float :latitude
      t.float :longitude
      t.datetime :start_time
      t.datetime :finish_time
      t.datetime :duration
      t.float :distance
      t.integer :price

      t.timestamps
    end
  end
end
