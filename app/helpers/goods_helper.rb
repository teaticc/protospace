module GoodsHelper
  def good_user(user_id, prototype_id)
    Good.find_by(user_id: user_id, prototype_id: prototype_id)
  end
end
