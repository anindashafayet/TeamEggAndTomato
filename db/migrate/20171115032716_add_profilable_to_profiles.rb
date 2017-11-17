class AddProfilableToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :profilable_id, :integer
    add_column :profiles, :profilable_type, :string
  end
end
