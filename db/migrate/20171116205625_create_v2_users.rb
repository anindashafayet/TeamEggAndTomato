class CreateV2Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password, null: false

      t.string :fname, null: false
      t.string :lname, null: false

      t.binary :salt
      t.timestamps
    end
  end
end
