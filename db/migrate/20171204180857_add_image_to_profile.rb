class AddImageToProfile < ActiveRecord::Migration[5.1]
  def change
    add_attachment :profiles, :image
  end
end
