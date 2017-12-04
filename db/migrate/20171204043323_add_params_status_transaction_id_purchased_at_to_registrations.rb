class AddParamsStatusTransactionIdPurchasedAtToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :notification_params, :text
    add_column :transactions, :transaction_id, :string
    add_column :transactions, :purchased_at, :datetime
  end
end
