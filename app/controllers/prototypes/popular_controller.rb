class Prototypes::PopularController < ApplicationController
  def index
  @prototypes = Prototype.popular.eager_load(:captured_images,:user).page(params[:page])
  end
end
