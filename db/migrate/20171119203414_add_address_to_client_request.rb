class AddAddressToClientRequest < ActiveRecord::Migration[5.1]
  def change
    add_reference :client_requests, :address, foreign_key: true
  end
end
