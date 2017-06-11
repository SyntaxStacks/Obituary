class AddObituaryToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :obituary, foreign_key: true
  end
end
