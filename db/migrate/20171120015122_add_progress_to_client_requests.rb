class AddProgressToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :client_requests, :progress, :integer
    add_column :client_requests, :fullfillment, :text
  end
end
