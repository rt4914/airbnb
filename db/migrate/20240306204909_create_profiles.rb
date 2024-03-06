class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
