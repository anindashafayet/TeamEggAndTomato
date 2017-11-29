class AddProfileReferencesToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :profile, foreign_key: true
  end
end
