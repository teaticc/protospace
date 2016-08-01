class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  accepts_nested_attributes_for :captured_images, reject_if: proc { |attributes| attributes["img_url"].blank?}
  validates :title, :copy, :concept , presence: true
  validate :must_has_just_one_main_image
  scope :popular, -> {order(goods_count: :desc)}
  acts_as_taggable_on :tags

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

  def must_have_just_one_main_image
    unless self.captured_images.select{ |i| i[:img_type] == 0}.length == 1
      errors.add(:captured_images, "prototype needs just one main image")
    end
  end

end
