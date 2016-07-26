class GoodsController < ApplicationController
  def create
    Good.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    good.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end
end