class ChangeTypeOfDurationInTrips < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :duration, :datetime
    add_column :trips, :duration, :integer
  end
end
