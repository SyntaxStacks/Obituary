class Obituary < ApplicationRecord
  belongs_to :user
  has_many :obituary_images
  accepts_nested_attributes_for :obituary_images

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def images=(files = [])
    byebug
    files.each do |f|
      obituary_images.create(image: f)
    end
  end
end
