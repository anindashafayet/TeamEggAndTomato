class AddAmountToClientRequest < ActiveRecord::Migration[5.1]
  def change
	  add_column :client_requests, :payment, :integer
	  add_column :client_requests, :payment_status, :string
  end
end
