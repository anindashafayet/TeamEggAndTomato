class AddUserToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_reference :applicants, :user, foreign_key: true
  end
end
