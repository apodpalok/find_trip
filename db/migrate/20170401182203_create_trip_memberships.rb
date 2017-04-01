class CreateTripMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_memberships do |t|
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
