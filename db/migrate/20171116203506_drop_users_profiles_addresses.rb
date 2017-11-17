class DropUsersProfilesAddresses < ActiveRecord::Migration[5.1]
  def change
    drop_table :users
    drop_table :profiles
    drop_table :addresses
  end
end
