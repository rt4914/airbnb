class RemoveStripeCustomerIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :stripe_customer_id
  end
end
