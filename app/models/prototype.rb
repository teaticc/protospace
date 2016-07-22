class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_one :main, class_name: :captured_image
  accepts_nested_attributes_for :captured_images, reject_if: proc { |attributes| attributes["img_url"].blank?}
  validates :title, :copy, :concept , presence: true

  def img_get(img_type)
    if img_type == "main"
      captured_images.main[0]
    elsif img_type == "sub"
      captured_images.sub
    end
  end
end
