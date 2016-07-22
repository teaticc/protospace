class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit]

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
      redirect_to :root, notice: "投稿しました"
    else
      redirect_to new_prototype_path, alert: "登録内容に不備があります"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    binding.pry
    prototype = Prototype.find(params[:id])
    if prototype.user_id == current_user.id
      prototype.destroy
    end
    redirect_to :root
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :title, captured_images_attributes: [:img_url, :img_type]).merge({user_id: current_user.id})
  end
end
