class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.order(id: :desc).page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end


  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
      redirect_to :root
    else
      redirect_to new_prototype_path, alert: "登録内容に不備があります"
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :title, captured_images_attributes: [:img_url, :img_type]).merge({user_id: current_user.id})
  end
end
