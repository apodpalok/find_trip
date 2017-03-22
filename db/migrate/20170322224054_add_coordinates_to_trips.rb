class AddCoordinatesToTrips < ActiveRecord::Migration[5.0]
  def change
    change_table :trips do |t|
      t.rename :latitude, :start_latitude
      t.rename :longitude, :start_longitude
      t.float :finish_latitude
      t.float :finish_longitude
    end
  end
end