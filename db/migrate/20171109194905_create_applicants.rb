class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.references :client_request, foreign_key: true
      #t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
