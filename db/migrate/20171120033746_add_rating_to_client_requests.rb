class AddRatingToClientRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :client_requests, :rating, :integer
    add_column :client_requests, :feedback, :text
  end
end
