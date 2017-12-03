class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :transaction_type
      t.string :transaction_method

      t.timestamps
    end
  end
end
