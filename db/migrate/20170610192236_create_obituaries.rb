class CreateObituaries < ActiveRecord::Migration[5.1]
  def change
    create_table :obituaries do |t|
      t.string :name
      t.timestamp :birth_date
      t.timestamp :death_date
      t.text :content

      t.timestamps
    end
  end
end
