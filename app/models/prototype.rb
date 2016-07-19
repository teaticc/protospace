class Prototype < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end

