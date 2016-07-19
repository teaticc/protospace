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
    binding.pry
    redirect_to :root
  end

  private
  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :image, :title)
  end
end
