class CreateV2Profiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user

      t.date :date_of_birth
      t.string :about_me
      t.string :phone
      t.string :gender

      t.timestamps
    end
  end
end
