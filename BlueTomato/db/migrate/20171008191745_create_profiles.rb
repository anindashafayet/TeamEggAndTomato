class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|

      t.time :date_of_birth
      t.text :description
      t.text  :phone
      t.text  :address
      t.integer  :gender
      #Gender 0 ==> male, 1 ==>female, 2 ==>Others
      t.timestamps
    end
  end
end
