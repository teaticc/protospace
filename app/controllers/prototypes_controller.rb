class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show]

  def index
    # eager_loadがcaptured_imagesに効いてない<=要修正
    @prototypes = Prototype.order(id: :desc).eager_load(:captured_images,:user).page(params[:page])
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
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :title, captured_images_attributes: [:img_url, :img_type]).merge({user_id: current_user.id})
  end
end
