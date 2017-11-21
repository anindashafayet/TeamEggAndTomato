class RemovePeriodsTypeFromClientRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :client_requests, :periods_type, :string
  end
end
