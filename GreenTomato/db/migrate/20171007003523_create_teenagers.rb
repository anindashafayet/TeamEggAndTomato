class CreateTeenagers < ActiveRecord::Migration
  def change
    create_table :teenagers do |t|
      t.string :'First Name'
      t.string :'Last Name'
      t.date :'Birth Date'
      t.string :'Home Address'
      t.string :'Email Address'
      t.string :'Cell Phone'

      t.timestamps null: false
    end
  end
end
