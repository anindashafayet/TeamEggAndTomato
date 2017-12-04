class DropCqcColumn < ActiveRecord::Migration[5.1]
  def change
	  remove_column :client_requests, :users_id
  end
end
