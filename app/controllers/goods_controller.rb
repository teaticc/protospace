class GoodsController < ApplicationController
  def create
    @good = Good.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @goods = Good.where(prototype_id: params[:prototype_id])
    redirect_to root_path
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    good.destroy
    @goods = Good.where(prototype_id: params[:prototype_id])
    redirect_to root_path
  end
end
