class AddMatchedUserToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :client_requests, :matched_user, :integer
  end
end
