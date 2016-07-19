class CapturedImage < ActiveRecord::Base
  mount_uploader :img_url, CapturedImageUploader
  belongs_to :prototype
  enum img_type: { main: 0, sub: 1}
end
