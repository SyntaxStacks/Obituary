class CreateObituaryImages < ActiveRecord::Migration[5.1]
  def change
    create_table :obituary_images do |t|

      t.timestamps
    end
  end
end
