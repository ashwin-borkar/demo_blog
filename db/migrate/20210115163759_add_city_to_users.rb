class AddCityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :integer
    add_column :users, :gender, :integer, default: 0
  end
end
