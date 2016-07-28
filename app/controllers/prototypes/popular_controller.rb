class Prototypes::PopularController < ApplicationController
  def index
  @prototypes = Prototype.order(goods_count: :desc).eager_load(:captured_images,:user).page(params[:page])
  end
end
