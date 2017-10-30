class RemovePeriodsTypeFromTeenOfferings < ActiveRecord::Migration[5.1]
  def change
    remove_column :teen_offerings, :periods_type, :string
  end
end
