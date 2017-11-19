class AddTitleToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :client_requests, :title, :string
  end
end
