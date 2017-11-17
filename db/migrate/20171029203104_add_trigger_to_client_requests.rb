class AddTriggerToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :client_requests, :trigger, :text
  end
end
