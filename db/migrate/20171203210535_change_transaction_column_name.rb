class ChangeTransactionColumnName < ActiveRecord::Migration[5.1]
  def change
	  rename_column :transactions, :user_id, :from
  end
end
