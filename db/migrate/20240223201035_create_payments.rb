class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
