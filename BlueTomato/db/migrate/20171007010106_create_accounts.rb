class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.text :email
      t.text :username
      t.binary :passwd
      t.text :privilege
      t.integer :timestamp
      t.binary :salt

      t.timestamps
    end
  end
end
