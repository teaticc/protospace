class PrototypesController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  private
  def prototype_params
    params.require(:prototype).permit(:copy, :concept, :image, :titile, :user_id)
  end
end
