class CapturedImage < ActiveRecord::Base
  enum image_type: { main_image: 0, sub_image: 1 }
  belongs_to :prototype
end
