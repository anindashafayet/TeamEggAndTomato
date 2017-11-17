class AddServiceNameToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :client_requests, :service_name, :string
  end
end
