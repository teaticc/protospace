module Common
  extend ActiveSupport::Concern

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
