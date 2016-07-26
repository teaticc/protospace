class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_one :main, class_name: :captured_image
  accepts_nested_attributes_for :captured_images, reject_if: proc { |attributes| attributes["img_url"].blank?}
  validates :title, :copy, :concept , presence: true
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy

  def img_get(img_type)
    if img_type == "main"
      captured_images.main[0]
    elsif img_type == "sub"
      captured_images.sub
    end
  end

  def sub_img_with_blank
   (4 - self.captured_images.length).times{self.captured_images.build(img_type: "sub")}
   self.captured_images[1..3]
  end

  def good_user(user_id)
    goods.find_by(user_id: user_id)
  end
end
