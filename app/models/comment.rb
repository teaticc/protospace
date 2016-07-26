class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :user
  validates :comment, presence: true
end
