class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :gender, :string
    add_column :users, :phone_number, :integer
    add_column :users, :mini_bio, :text
    add_column :users, :address, :string
    add_column :users, :address2, :string
    add_column :users, :postcode, :integer
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
