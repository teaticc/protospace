class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :prototypes
  validates :name, presence: true
  has_many :goods
  has_many :comments
end
