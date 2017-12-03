class AddTargetToTransactions < ActiveRecord::Migration[5.1]
  def change
	  add_column :transactions, :target, :integer
  end
end
