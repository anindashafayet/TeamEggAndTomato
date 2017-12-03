class AddColumnToTransactions < ActiveRecord::Migration[5.1]
  def change
	  add_column :transactions, :creq_id, :integer
  end
end
