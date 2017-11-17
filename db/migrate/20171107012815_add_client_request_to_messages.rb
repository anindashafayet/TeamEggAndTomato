class AddClientRequestToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :client_request, foreign_key: true, index: true
  end
end
