class GoodsController < ApplicationController
  include Common
  before_action :set_prototype, only: :create

  def create
    @prototype.goods.create(user_id: current_user.id)
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    good.destroy
    set_prototype
  end
end
