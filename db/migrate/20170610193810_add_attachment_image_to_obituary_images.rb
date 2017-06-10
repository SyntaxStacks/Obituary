class AddAttachmentImageToObituaryImages < ActiveRecord::Migration
  def self.up
    change_table :obituary_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :obituary_images, :image
  end
end
