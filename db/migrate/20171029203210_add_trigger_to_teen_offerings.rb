class AddTriggerToTeenOfferings < ActiveRecord::Migration[5.1]
  def change
    add_column :teen_offerings, :trigger, :text
  end
end
