class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :prototypes
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
end
