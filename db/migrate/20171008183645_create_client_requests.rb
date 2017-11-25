class CreateClientRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :client_requests do |t|
      t.integer :service_type_id
      t.string :periods_type
      t.date :period
      t.string :period_detail
      t.text :detail
      #t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
