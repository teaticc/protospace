class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def show
  end

  def create
    Prototype.create(prototype_params)
    redirect_to :root
  end

  private
  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :title, captured_images_attributes: [:img_url, :img_type]).merge({user_id: current_user.id})
  end
end
