class AddMoneyToPayments < ActiveRecord::Migration[7.0]
  def change
    add_monetize :payments, :base_fare, amount: { null: true, default: nil }, currency: { null: true, default: nil }
    add_monetize :payments, :service_fee, amount: { null: true, default: nil }, currency: { null: true, default: nil }
    add_monetize :payments, :total_amount, amount: { null: true, default: nil }, currency: { null: true, default: nil }
  end
end
