class Prototype < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :captured_images
  accepts_nested_attributes_for :captured_images
end
