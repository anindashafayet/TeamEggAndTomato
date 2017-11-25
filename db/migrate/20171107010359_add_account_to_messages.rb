class AddAccountToMessages < ActiveRecord::Migration[5.1]
  def change
    #add_reference :messages, :user, foreign_key: true, index: true
  end
end
