class CreateTeenOfferings < ActiveRecord::Migration[5.1]
  def change
    create_table :teen_offerings do |t|
      t.integer :account_id
      t.integer :service_type
      t.string :periods_type
      t.date :period
      t.string :period_detail
      t.text :offering_detail

      t.timestamps
    end
  end
end
