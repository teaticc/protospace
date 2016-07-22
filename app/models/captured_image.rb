class CapturedImage < ActiveRecord::Base
  mount_uploader :img_url, CapturedImageUploader
  enum img_type: { main: 0, sub: 1 }
  belongs_to :prototype, dependent: :destroy
end
