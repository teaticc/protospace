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
    prototype = Prototype.new(prototype_params)
    if prototype.save
      redirect_to :root
    else
      redirect_to new_prototypes_path, alert: "登録内容に不備があります"
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :title, captured_images_attributes: [:img_url, :img_type, :image_cache]).merge({user_id: current_user.id})
  end
end
