class AddSeatsToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :seats, :integer
  end
end
