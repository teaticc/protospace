class GoodsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @prototype.goods.create(user_id: current_user.id)
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    good.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end
end
