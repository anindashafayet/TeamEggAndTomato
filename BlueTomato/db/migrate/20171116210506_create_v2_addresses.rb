class CreateV2Addresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :profile

      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
