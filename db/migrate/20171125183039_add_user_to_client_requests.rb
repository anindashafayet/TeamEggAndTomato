class AddUserToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :client_requests, :users, foreign_key: true
  end
end
