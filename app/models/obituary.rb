class Obituary < ApplicationRecord
  belongs_to :user
  has_many :obituary_images
  has_many :comments
  accepts_nested_attributes_for :obituary_images
  acts_as_commentable

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def images=(files = [])
    files.each do |f|
      obituary_images.create(image: f)
    end
  end
end
