module Common
  extend ActiveSupport::Concern

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def return_sign_out_user
    unless user_signed_in?
      redirect_to root_path, notice: "please sign in"
    end
  end
end
