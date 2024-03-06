class RemoveColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name
    remove_column :users, :address_1
    remove_column :users, :address_2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :country
  end
end
