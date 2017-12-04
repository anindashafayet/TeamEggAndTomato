class CreateFreeAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :free_addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
      end
    end
end