class Good < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: :goods_count
end
