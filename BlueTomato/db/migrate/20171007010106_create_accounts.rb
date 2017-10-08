class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      #t.belongs_to :accountable, index: {unique: true}, foreign_key: true
      t.text :email
      t.text :username
      t.binary :passwd
      t.text :privilege
      t.integer :timestamp
      t.binary :salt
      t.integer :accountable_id
      t.string :accountable_type

      t.timestamps
    end
    add_index :accounts, [:accountable_id, :accountable_type], :unique => true
  end
end