class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :destroy, :update]

  def index
    # eager_loadがcaptured_imagesに効いてない<=要修正
    @prototypes = Prototype.order(id: :desc).includes(:tags).eager_load(:user).page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "投稿しました"
    else
      render :new
    end
  end

  def show
     @comment = Comment.new
  end

  def edit
    @sub_img = @prototype.sub_img_with_blank
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: "successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    if @prototype.user_id == current_user.id
      @prototype.destroy
    end
    redirect_to root_path, notice: "successfully deleted"
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :title, tag_list: [], captured_images_attributes: [:img_url, :img_type, :id]).merge(user_id: current_user.id)
  end
end
