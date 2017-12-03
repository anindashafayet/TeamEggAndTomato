class AddUserToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :users, foreign_key: true
  end
end
