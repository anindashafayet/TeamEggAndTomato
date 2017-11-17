class CreateTeenagers < ActiveRecord::Migration[5.1]
  def change
    create_table :teenagers do |t|
      t.string :'fname'
      t.string :'lname'
      t.date :'birth_date'
      t.string :'home_address'
      t.string :'email_address'
      t.string :'cell_phone'

      t.timestamps
    end
  end
end





