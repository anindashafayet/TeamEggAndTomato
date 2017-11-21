class AddIspublicToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :ispublic, :boolean
  end
end
