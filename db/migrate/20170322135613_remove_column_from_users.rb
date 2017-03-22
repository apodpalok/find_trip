class RemoveColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :phone_number, :integer
    remove_column :users, :postcode, :integer
  end
end
