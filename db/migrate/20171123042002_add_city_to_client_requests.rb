class AddCityToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :client_requests, :city, :string
  end
end
