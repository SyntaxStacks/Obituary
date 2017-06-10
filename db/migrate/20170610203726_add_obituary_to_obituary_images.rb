class AddObituaryToObituaryImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :obituary_images, :obituary, foreign_key: true
  end
end
