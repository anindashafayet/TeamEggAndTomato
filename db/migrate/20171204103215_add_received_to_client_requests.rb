class AddReceivedToClientRequests < ActiveRecord::Migration[5.1]
  def change
	  add_column :client_requests, :received, :string
  end
end
