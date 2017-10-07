class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      #t.integer :'client_id'
      t.string :'name'
      t.string :'home_address'
      t.string :'email'
      t.string :'cell_phone'
      t.binary :'picture'
      t.references :bank, foreign_key: true
      t.timestamps null: false
    end
  end
end
