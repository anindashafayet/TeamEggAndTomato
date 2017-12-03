class AddTransactionAmountToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :transaction_amount, :integer
  end
end
