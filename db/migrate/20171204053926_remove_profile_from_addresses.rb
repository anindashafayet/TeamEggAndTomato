class RemoveProfileFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :addresses, :profile, foreign_key: true
  end
end
