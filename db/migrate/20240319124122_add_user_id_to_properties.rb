class AddUserIdToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :user, null: false, foreign_key: true
  end
end
