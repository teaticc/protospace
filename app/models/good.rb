class Good < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: :good_count
end
