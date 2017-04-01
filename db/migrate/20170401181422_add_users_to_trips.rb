class AddUsersToTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers_trips, id: false do |t|
      t.integer :driver_id
      t.integer :trip_id
    end

    create_table :passengers_trips, id: false do |t|
      t.integer :passenger_id
      t.integer :trip_id
    end
  end
end
