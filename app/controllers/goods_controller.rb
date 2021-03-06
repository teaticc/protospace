class GoodsController < ApplicationController
  include Common
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @prototype.goods.create(user_id: current_user.id)
  end

  def destroy
    @prototype.goods.find_by(user_id: current_user.id).destroy
    set_prototype
  end
end
